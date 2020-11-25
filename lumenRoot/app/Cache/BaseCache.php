<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2020-11-25
 * @version 1.0
 */

namespace App\Cache;


use Illuminate\Support\Facades\Redis;

class BaseCache
{

    protected $redis = null;

    /**
     * 集群前缀
     */
    const CACHE_PRE = 'wx_';

    public function __construct($class = 'default')
    {
        $this->redis = Redis::connection($class);
    }


    /**
     * 获取键值,第一个参数是键值,其他参数跟随
     */
    public static function getKey()
    {
        $arr = func_get_args();
        $arr[0] = self::CACHE_PRE . $arr[0];
        return call_user_func_array('sprintf', $arr);
    }


    /**
     * 序列化操作
     * @param $data
     * @return string
     */
    private function serialize($data)
    {
        if (is_array($data) || is_object($data) || is_bool($data) || is_null($data)) {
            $data = serialize($data);
        }
        return $data;
    }

    /**
     * 反序列化，判断操作
     * @param $data
     * @return bool|mixed|null
     */
    private function unserialize($data)
    {
        if (is_string($data)) {
            if ($data == "N;") return null;
            if (substr($data, 1, 1) == ":") {
                if ($data == "b:0;") return false;
                $_data = @unserialize($data);
                if ($_data !== false) {
                    return $_data;
                }
            }
        }

        return $data;
    }

    //get 使用unserialize反序列化
    public function get($key)
    {
        $result = $this->redis->get($key);
        return $this->unserialize($result);
    }

    //set 使用serialize序列化
    public function set($key, $data, $ttl = 86400)
    {
        $data = $this->serialize($data);
        if ($ttl) {
            return $this->redis->setex($key, $ttl, $data);
        } else {
            return $this->redis->set($key, $data);
        }
    }

    //hSet
    public function hSet($key, $subKey, $value, $ttl = 86400)
    {
        $value = $this->serialize($value);

        if ($this->redis->exists($key)) {
            $ret = $this->redis->hSet($key, $subKey, $value);
        } else {
            $ret = $this->redis->hSet($key, $subKey, $value);
            if ($ttl) {
                $this->redis->expire($key, $ttl);
            }
        }
        return $ret;
    }

    //hGet
    public function hGet($key, $subKey)
    {
        $result = $this->redis->hGet($key, $subKey);
        return $this->unserialize($result);
    }

    public function hGetAll($key)
    {
        $result = $this->redis->hgetall($key);
        return $this->unserialize($result);
    }

    /**
     * 递增
     * @param     $key
     * @param int $offset
     * @param int $ttl
     * @return mixed
     */
    function incr($key, $offset = 1, $ttl = 86400)
    {
        $incr = $this->redis->incrby($key, $offset);
        if ($incr == $offset) {
            $this->redis->expire($key, $ttl);
        }
        return $incr;
    }

    /**
     * 递减
     * @param     $key
     * @param int $offset
     * @param int $ttl
     * @return mixed
     */
    function decr($key, $offset = 1, $ttl = 86400)
    {
        $decr = $this->redis->decrby($key, $offset);
        if ($decr == -1 * $offset) {
            $this->redis->expire($key, $ttl);
        }
        return $decr;
    }

    /**
     * 哈希递增
     * @param     $key
     * @param     $subKey
     * @param     $offset
     * @param int $ttl
     * @return int
     */
    public function hincr($key, $subKey, $offset = 1, $ttl = 86400)
    {
        $hincr = $this->redis->hIncrBy($key, $subKey, $offset);
        if ($hincr == $offset) { //第一次插入设置过期时间
            $this->redis->expire($key, $ttl);
        }
        return $hincr;
    }

    /**
     * 列表推送
     * @param     $key
     * @param     $value
     * @param int $ttl
     * @return mixed
     */
    public function lPush($key, $value, $ttl = 86400)
    {
        if ($this->redis->exists($key)) {
            $ret = $this->redis->lPush($key, $value);
        } else {
            $ret = $this->redis->lPush($key, $value);
            if ($ttl) {
                $this->redis->expire($key, $ttl);
            }
        }
        return $ret;
    }

    /**
     * 列表推送
     * @param     $key
     * @param     $value
     * @param int $ttl
     * @return mixed
     */
    public function rPush($key, $value, $ttl = 86400)
    {
        if ($this->redis->exists($key)) {
            $ret = $this->redis->rPush($key, $value);
        } else {
            $ret = $this->redis->rPush($key, $value);
            if ($ttl) {
                $this->redis->expire($key, $ttl);
            }
        }
        return $ret;
    }

    //获取队列数据
    public function lRange($key, $start, $end)
    {
        return $this->redis->lRange($key, $start, $end);
    }

    /**
     * 更新过期时间
     * @param     $key
     * @param int $ttl
     */
    public function expire($key, $ttl = 86400)
    {
        if ($ttl) {
            $this->redis->expire($key, $ttl);
        }
    }

    //hMSet 不会序列化
    public function hMset($key, $value, $ttl = 86400)
    {
        if ($this->redis->exists($key)) {
            $ret = $this->redis->hmSet($key, $value);
        } else {
            $ret = $this->redis->hmSet($key, $value);
            if ($ttl) {
                $this->redis->expire($key, $ttl);
            }
        }
        return $ret;
    }

    /**
     * @param $key
     * @return array|bool
     */
    public function getMetaData($key)
    {
        $value = $this->get($key);
        if ($value) {
            return [
                'expire' => time() + $this->redis->ttl($key),
                'data'   => $value
            ];
        }
        return false;
    }

    public function del($key)
    {
        return $this->redis->del($key);
    }

    public function hDel($key)
    {
        return $this->redis->hdel($key);
    }

}