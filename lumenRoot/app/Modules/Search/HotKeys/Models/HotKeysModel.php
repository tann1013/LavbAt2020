<?php
/**
 * @author tanj@weipaitang.com
 * @date   2019-05-31 16:23
 */

namespace App\Modules\Search\HotKeys\Models;

use App\Models\BaseModel;
use App\Modules\Search\HotKeys\Consts\HotKeysConst;

class HotKeysModel extends BaseModel
{
    protected $table = "hotkeys";

    /**
     * 批量删除热词
     * @param $id_list
     * @return bool
     */
    public function deleteByIdList($idLists, $extra = [])
    {
        $ids = [];
        if ($idLists) {
            $update = [
                'isDel' => 1,
                'state' => HotKeysConst::KEY_STATUS_OFFLINE,
            ];
            unset($extra['ids']);
            $update = array_merge($update, $extra);
            foreach ($idLists as $id) {
                $result = $this->updateData($update, ['id' => $id]);
                if ($result) {
                    $ids[] = $id;
                }
            }
        }
        return $ids;
    }

    /**
     * 批量下线热词#HotKeysOffLine
     * @param $id_list
     * @return bool
     */
    public function hotKeysOffLineProcessByIdList($idList)
    {
        $ids = [];
        if (!empty($idList)) {
            $update = [
                'state' => HotKeysConst::KEY_STATUS_OFFLINE,
            ];
            foreach ($idList as $id) {
                $result = $this->updateData($update, ['id' => $id]);
                if ($result) {
                    $ids[] = $id;
                }
            }
        }
        return $ids;
    }

    /**
     * 批量上线热词
     * @param $id_list
     * @return bool
     */
    public function hotKeysOnLineProcessByIdList($idList)
    {
        $ids = [];
        if (!empty($idList)) {
            $update = [
                'state' => HotKeysConst::KEY_STATUS_ONLINE,
            ];
            foreach ($idList as $id) {
                $result = $this->updateData($update, ['id' => $id]);
                if ($result) {
                    $ids[] = $id;
                }
            }
        }
        return $ids;
    }

    /**
     * 拖拽排序更新
     * @param $idList
     * @return bool
     * @throws \Exception
     */
    public function _listSortByIdList($idList, $dragId, $extra = [])
    {
        if (empty($idList)) {
            return build_error_rst(['ids' => []]);
        }

        // 获取所有已经的id和sort对应关系
        $lists = $this->where('isDel', HotKeysConst::IS_DEL_NO)
            ->whereIn('id', $idList)
            ->orderBy('sort', 'ASC')
            ->get()
            ->keyBy('id');

        // 如果无数据不需处理
        if (!$lists) {
            return build_error_rst(['ids' => []]);
        }

        $lists = $lists->toArray();

        $idSortMapArr = array_keys($lists);

        // 重置一遍所有的sort索引
        foreach ($idSortMapArr as $kSort => $id) {
            $this->where('id', $id)->update(['sort' => $kSort]);
        }

        // key，value翻转
        $idList = array_flip($idList);
        $idSortMapArr = array_flip($idSortMapArr);

        $mustUpdateIds = [];
        foreach ($idList as $id => $sort) {
            if ($idList[$id] == $idSortMapArr[$id]) {
                continue;
            }
            $mustUpdateIds[] = [
                'id'   => $id,
                'sort' => $sort,
                'info' => (array)$lists[$id]
            ];
        }

        $ids = [];
        $this->beginTransaction();
        foreach ($mustUpdateIds as $val) {
            if ($dragId == $val['id']) {
                if (isset($extra['state'])) {
                    unset($extra['state']);
                }
                if ($this->checkCanSetDefaultState($val['info']['startTime'], $val['info']['endTime'])) {
                    $extra['state'] = HotKeysConst::KEY_STATUS_DEFAULT;
                }
                $result = $this->where('id', $val['id'])->update(array_merge([
                    'sort' => $val['sort'],
                ], $extra));
            } else {
                $result = $this->where('id', $val['id'])->update(['sort' => $val['sort']]);
            }
            if (!$result) {
                $this->rollBack();
                return build_error_rst("id: {$val['id']}, 排序操作失败", 1);
            }
            $ids[] = $val;
        }
        $this->commit();

        return build_error_rst(['ids' => $ids]);
    }

    /**
     * 是否需要设置新状态
     * @param $inputs
     * @param $newState
     */
    private function checkCanSetDefaultState($startTime, $endTime)
    {
        $nowTime = time();

        // 过期判断
        if ($nowTime > $endTime) {
            return false;
        }

        // 生效时间判断
        if ($nowTime < $endTime && $nowTime > $startTime) {
            return false;
        }

        // 未来将生效判断
        if ($nowTime < $startTime) {
            return true;
        }
    }

    /**
     * 查询已有直播热词
     * @return mixed
     */
    public function getNameByIdsWithLiveGenerate()
    {
        return $this->where('isDel', HotKeysConst::IS_DEL_NO)
            ->where('keySource', HotKeysConst::KEY_SOURCE_AUTO)
            ->select(['id', 'keyName'])
            ->pluck('id', 'keyName')
            ->toArray();
    }

    /**
     * 查询已有手动添加热词
     * @return mixed
     */
    public function getNameByIdsWithUserAdd()
    {
        return $this->where('isDel', HotKeysConst::IS_DEL_NO)
            ->where('keySource', HotKeysConst::KEY_SOURCE_USER)
            ->where('keyType', HotKeysConst::TYPE_LIVE)
            ->select(['id', 'sort'])
            ->orderBy('sort', 'ASC')
            ->get()
            ->toArray();
    }

    /**
     * 获取类别下最大
     * @param $keyType
     * @return int
     */
    public function getTypeMaxSort($keyType)
    {
        $info = $this->where('isDel', HotKeysConst::IS_DEL_NO)
            ->where('keyType', $keyType)
            ->select(['sort'])
            ->orderBy('sort', 'DESC')
            ->first();

        return empty($info) ? 0 : $info->sort + 1;
    }

}