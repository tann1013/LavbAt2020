<?php
/**
 * Created by PhpStorm.
 * User: gaotao
 * Date: 18/7/9
 * Time: 下午3:16
 */

use App\Libraries\writelog\WriteLog;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Exception\RequestException;

/**
 * get_micro_time
 * @param int $num
 * @return int
 */
if (!function_exists('get_micro_time')) {
    function get_micro_time($num = 3)
    {
        return (int)str_replace(".", "", sprintf("%.{$num}f", microtime(true)));
    }
}

/**
 * 获取数组元素 或对象
 */
if (!function_exists('get_property') && !function_exists('gp')) {
    function get_property($obj, $property, $default = null)
    {
        if (!$obj) return $default;
        is_string($obj) and $obj = json_decode($obj, true);
        if (is_object($obj)) {
            return property_exists($obj, $property) ? $obj->$property : $default;
        }

        return isset($obj[$property]) ? $obj[$property] : $default;
    }

    function gp(...$args)
    {
        return get_property(...$args);
    }
}

if (!function_exists('json_encode_clean')) {
    /**
     * 获取更干净的json字符串
     * @param array $array
     * @return string
     */
    function json_encode_clean(array $array): string
    {
        return json_encode($array, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }
}

if (!function_exists('get_env_array')) {
    function get_env_array($_key, $_is_rand = false)
    {
        $value = env($_key);
        if (!is_null($value)) {
            $value = explode(',', $value);
            if ($_is_rand) {
                shuffle($value);
            }
        }

        return $value;
    }
}

if (!function_exists('get_user_name')) {
    /**
     * @param $userData
     * @return string
     */
    function get_user_name($userData)
    {
        return !empty(get_property($userData, 'nickname', ''))

            ?
            get_property($userData, 'nickname', '')
            :
            get_property($userData, 'name', '');
    }
}

if (!function_exists('variable_to_string')) {
    /**
     * 将一个变量转为字符串
     *  float使用var_export得到的字符串不准确
     *  resource使用var_export得到的是null
     * @param $variable
     * @return string
     */
    function variable_to_string($variable)
    {
        return is_float($variable)
            ?
            (string)$variable
            :
            (
            is_resource($variable)
                ?
                "'resource of type'"
                :
                var_export($variable, true)
            );
    }
}

/**
 * 获取值
 *
 * 1) 两个参数 第一个为参数 第二个为默认值
 * 2) 三个参数 数组或对象 第一个为参数 第二个为键 第三个为默认值
 * 3) 四个参数 数组或对象 第一个为参数 第二个为键 第三个为默认值 第四个为回调函数意在对结果进行进一步处理
 *
 * @param      $_data
 * @param      $_key
 * @param null $_default_value
 * @return mixed|null
 */
if (!function_exists('get_value')) {
    function get_value()
    {
        $args = func_get_args();
        $value = null;
        switch (count($args)) {
            case 2:
                //单一变量
                list($_data, $_default_value) = $args;
                $value = $_default_value;
                if (!is_null($_data)) {
                    $value = $_data;
                }
                break;
            case 3:
                //数组或对象
                list($_data, $_key, $_default_value) = $args;
                $value = $_default_value;
                if (is_array($_data)) {
                    if (isset($_data[$_key])) {
                        $value = $_data[$_key];
                    }
                } else if (is_object($_data)) {
                    if (property_exists($_data, $_key)) {
                        $value = $_data->$_key;
                    };
                }
                break;
            case 4:
                //数组或对象+回调函数
                list($_data, $_key, $_default_value, $_closure) = $args;
                $value = $_default_value;
                if (is_array($_data)) {
                    if (isset($_data[$_key])) {
                        $value = $_data[$_key];
                    }
                } else if (is_object($_data)) {
                    if (property_exists($_data, $_key) || isset($_data->$_key)) {
                        $value = $_data->$_key;
                    };
                }
                if ('Closure' == get_class($_closure)) {
                    $value = $_closure($value);
                }
                break;
        }

        return $value;

    }
}

if (!function_exists('object_to_array')) {
    /**
     * @param $object
     * @return array
     */
    function object_to_array($object)
    {
        return json_decode(json_encode($object), true);
    }
}

if (!function_exists('array_to_object')) {
    /**
     * @param array $array
     * @return stdClass
     */
    function array_to_object($array)
    {
        return json_decode(json_encode($array));
    }
}

if (!function_exists('rand_keys')) {
    /**
     * 获取指定长度随机字符串
     * @param int $length
     * @return string
     */
    function rand_keys(int $length = 32): string
    {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }
}

if (!function_exists('httpPost')) {
    function httpPost($_url, $_data = null)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if (!empty($_data)) {
            curl_setopt($ch, CURLOPT_POST, 1);
            $_data = is_array($_data) ? http_build_query($_data) : $_data;
            curl_setopt($ch, CURLOPT_POSTFIELDS, $_data);
        }

        $error = curl_error($ch);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
}


if (!function_exists('int_format')) {
    function int_format($val)
    {
        return intval(number_format($val, 2, ".", ""));
    }
}

if (!function_exists('curl_http_request')) {
    function curl_http_request($url, $data = [], $method = 'GET', $dataType = 'form_params')
    {
        $debugData = [
            'url'    => $url,
            'data'   => $data,
            'method' => $method
        ];
        try {
            $options = [
                'timeout' => config('app.curl_timeout'),
                'verify'  => false,
            ];
            $method = strtoupper($method);
            if (!empty($data)) {
                if ($method == 'GET') {
                    $options['query'] = $data;
                } else if ($method == 'POST' && $dataType == 'form_params') {
                    $options['form_params'] = $data;
                } else if ($method == 'POST' && $dataType == 'json') {
                    $options['json'] = $data;
                }
            }
            $client = new \GuzzleHttp\Client();
            $response = $client->request($method, $url, $options);
            $responseContent = $response->getBody()->getContents();
            $responseCode = $response->getStatusCode();
            if ($responseCode == 200) {
                $result = json_decode($responseContent, true);
                return $result;
            } else {
                $debugData['responseCode'] = $responseCode;
                $debugData['content'] = $responseContent;
                \Illuminate\Support\Facades\Log::error('[CURL]curl请求状态码非200错误', $debugData);
                return [];
            }
        } catch (\Exception $exception) {
            $debugData['file'] = $exception->getFile();
            $debugData['line'] = $exception->getLine();
            $debugData['message'] = $exception->getMessage();
            \Illuminate\Support\Facades\Log::error('[CURL]curl请求抛出异常', $debugData);
            return [];
        }
    }
}

if (!function_exists('curl_http_get')) {
    function curl_http_get($url, $data = [])
    {
        return curl_http_request($url, $data, 'GET');
    }
}

if (!function_exists('curl_http_post')) {
    /**
     * @param string $url      请求地址
     * @param array  $data     请求数据
     * @param string $dataType 数据格式 form_params:表单提交 json:JSON格式提交
     * @return array
     */
    function curl_http_post($url, $data = [], $dataType = 'form_params')
    {
        return curl_http_request($url, $data, 'POST', $dataType);
    }
}

if (!function_exists('str_to_ascii')) {
    /**
     * [字符串转换为(2,8,16进制)ASCII码]
     * @param  string  $str     [待处理字符串]
     * @param  boolean $encode  [字符串转换为ASCII|ASCII转换为字符串]
     * @param  string  $intType [2,8,16进制标示]
     * @return string  byte_str [处理结果]
     * @author alexander
     */
    function str_to_ascii($str, $encode = true, $intType = "2"): string
    {
        if ($encode == true) {
            $byte_array = str_split($str);
            foreach ($byte_array as &$value) {
                $value = ord($value);
                switch ($intType) {
                    case 16:
                        $value = sprintf("%02x", $value);
                        break;
                    case 8:
                        $value = sprintf("%03o", $value);
                        break;
                    default:
                        $value = sprintf("%08b", $value);
                        break;
                }
            }
            unset($value);
            $byte_str = implode('', $byte_array);
        } else {
            $chunk_size = $intType == 16 ? 2 : ($intType == 8 ? 3 : 8);
            $byte_array = chunk_split($str, $chunk_size);
            $byte_array = array_filter(explode("\r\n", $byte_array));
            foreach ($byte_array as &$value) {
                $fun_name = $intType == 16 ? 'hexdec' : ($intType == 8 ? 'octdec' : 'bindec');
                $value = $fun_name($value);
                $value = chr($value);
            }
            unset($value);
            $byte_str = implode('', $byte_array);
        }
        return $byte_str;
    }
}

if (!function_exists('array_orderby')) {
    /**
     * 二维数组排序
     * @return mixed
     */
    function array_orderby()
    {
        $args = func_get_args();
        $data = array_shift($args);
        foreach ($args as $n => $field) {
            if (is_string($field)) {
                $tmp = array();
                foreach ($data as $key => $row)
                    $tmp[$key] = $row[$field];
                $args[$n] = $tmp;
            }
        }
        $args[] = &$data;
        call_user_func_array('array_multisort', $args);
        return array_pop($args);
    }
}

/**
 * 拼接muid
 * @param $url
 * @return string
 */
if (!function_exists('addMuid')) {
    function addMuid($url)
    {
        if (strpos($url, '?') === false) {
            return $url . '?muid={MUID}';
        }
        return $url . '&muid={MUID}';
    }
}


if (!function_exists('getWeChatTplArr')) {
    function getWeChatTplFormat($wxdata)
    {
        $data = [
            "usertype" => 2,
            "msgtype"  => "tpl",
            "data"     => json_encode([
                "content" => $wxdata
            ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
        ];
        return $data;
    }
}

/**
 * 获取微信文本消息消息体
 * @param       $message
 * @param array $params
 * @return array
 */
if (!function_exists('getWechatTextArr')) {
    function getWechatTextArr($message, $params = [])
    {
        $data = [
            "usertype" => 2,
            "msgtype"  => "text",
            "data"     => json_encode([
                "text"      => $message,
                "needblock" => true
            ])
        ];
        $dataReport = [];
        !empty($params['wtid']) && $dataReport['wtid'] = (string)$params['wtid'];   //wtid,消息文案的唯一id,如该消息有多种分享文案,则不同消息使用不同wtid,如果仅有单一类型消息,该key不传递
        !empty($params['salelist']) && $dataReport['salelist'] = $params['salelist'];   //saleuri List,如果该消息中含有saleuri,以数组的形式传递sale的uri,如果没有,该key不传递
        !empty($params['shopid']) && $dataReport['shopid'] = (string)$params['shopid'];   //shopid,可获得shopid时传递,如果没有,该key不传递
        !empty($params['shopuri']) && $dataReport['shopuri'] = (string)$params['shopuri'];   //shouuri,可获得shouuri，如果没有,该key不传递
        if (!empty($dataReport)) {
            $data['datareport'] = json_encode($dataReport);
        }

        return $data;
    }
}



if (!function_exists('validateDateTime')) {
    /**
     * @param $dataTime
     * @return bool
     */
    function validateDateTime($dataTime)
    {
        $patten = "/^\d{4}[\-](0?[1-9]|1[012])[\-](0?[1-9]|[12][0-9]|3[01])(\s+(0?[0-9]|1[0-9]|2[0-3])\:(0?[0-9]|[1-5][0-9])\:(0?[0-9]|[1-5][0-9]))?$/";
        if (preg_match($patten, $dataTime)) {
            return true;
        }
        return false;
    }
}

if (!function_exists('validate_mobile')) {
    /**
     * 验证是否手机号码
     * @param string $text
     * @return int 1,2,3-手机号，0-非手机号
     */
    function validate_mobile($text)
    {
        $_emp = '/^\\s*|\\s*$|-/';
        $text = preg_replace($_emp, '', $text);

        $_d = '/^1[3578][01379]\d{8}$/';
        $_l = '/^1[34578][01256]\d{8}$/';
        $_y = '/^(134[012345678]\d{7}|184\\d{8}|1[34578][012356789]\d{8})$/';
        if (preg_match($_d, $text)) {
            return 3;
        } else if (preg_match($_l, $text)) {
            return 2;
        } else if (preg_match($_y, $text)) {
            return 1;
        }
        return 0;
    }
}

if (!function_exists('postPageSimple')) {
    function postPageSimple($url, $data, $timeout = 1)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        //连接时间
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        //返回响应时间
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);

        curl_setopt($ch, CURLOPT_POST, 1); // 发送一个常规的Post请
        curl_setopt($ch, CURLOPT_POSTFIELDS, is_string($data) ? $data : http_build_query($data)); // Post提交的数据包求

        $result = curl_exec($ch);
        if (curl_errno($ch) > 0) {
            wptLog(curl_error($ch) . ',' . $url . ',' . var_export($data, true), 'error/postPageSimple.log');
        }
        curl_close($ch);
        return $result;
    }
}