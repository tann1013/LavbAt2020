<?php
/**
 * @author tanj@weipaitang.com
 * @date   2019-05-31 16:29
 */

namespace App\Modules\Search\HotKeys\Logics;

use App\ConstDir\ErrorConst;
use App\Modules\Search\HotKeys\Consts\HotKeysConst;
use App\Libraries\writelog\WriteLog;
use App\Modules\Search\HotKeys\Models\HotKeysModel;
use App\Services\UserDDInfoService;
use App\Utils\CommonUtil;

class HotKeysLogic
{
    private $hotKeysModel;
    private $userDDInfo;

    /**
     * CollegeLogic constructor.
     */
    public function __construct()
    {
        $this->hotKeysModel = new HotKeysModel();
        $this->userDDInfo = app()->make(UserDDInfoService::class);
    }

    public function addHotKey($inputs)
    {
        $keyName = $inputs['keyName'];
        $keyType = $inputs['keyType'];

        //必填项验证
        if (empty($keyName)) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '热词为必填项');
        }
        // 必填项验证#keyType
        if (empty($keyType) && !in_array($keyType, [HotKeysConst::TYPE_SALE, HotKeysConst::TYPE_SHOP, HotKeysConst::TYPE_LIVE])) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '热词类型填写有误');
        }

        $hotKeys = $this->hotKeysModel->getOne(['id'], [
            'keyName'   => $keyName,
            'keyType'   => $keyType,
            'keySource' => HotKeysConst::KEY_SOURCE_USER,
            'isDel'     => HotKeysConst::IS_DEL_NO,
        ]);
        if ($hotKeys) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '不能重复添加同类型热词');
        }
        // 是否设置热搜
        if ($inputs['isSetRed'] == 1) {
            $inputs['isRed'] = HotKeysConst::KEY_IS_RED_YES;
        }

        //时间区间处理逻辑(未填写开始时间为当前，结束时间为一个月后)
        $nowTime = time();
        $startTime = $inputs['startTime'];
        $startTime = $startTime ?: $nowTime;
        $endTime = $inputs['endTime'];
        $endTime = $endTime ?: strtotime(HotKeysConst::TIME_FOR_EVER);
        if ($startTime >= $endTime) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '热词的开始时间不能大于等于结束时间');
        }

        if ($endTime > HotKeysConst::TIME_FOR_EVER_UNIX) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '结束时间不能大于:' . HotKeysConst::TIME_FOR_EVER);
        }

        //入库
        unset($inputs['isSetRed']);
        $inputs['createTime'] = $inputs['manModifyTime'] = $nowTime;
        $inputs['manModify'] = 1;
        $inputs['sort'] = $this->hotKeysModel->getTypeMaxSort($keyType);
        $result = $this->hotKeysModel->insertData($inputs);
        $returnDate = ['success' => 0, 'msg' => '操作失败'];
        if ($result > 0) {
            $returnDate['success'] = 1;
            $returnDate['msg'] = '操作成功';
        }

        return $returnDate;
    }

    /**
     * @param      $inputs
     * @param bool $is_base
     * @return array
     */
    public function getList($inputs)
    {
        $keyType = $inputs['keyType'];
        $keywords = $inputs['keywords'];
        $state = $inputs['state'];

        // 查询
        $whereSql = ['isDel' => HotKeysConst::IS_DEL_NO];
        if (!empty($keyType)) {
            $whereSql['keyType'] = $keyType;
        }

        // 获取所有的类别下的数据
        $allTotal = $this->hotKeysModel->count($whereSql);

        // 是否搜索关键词
        if (!empty($keywords)) {
            $whereSql['keyName like'] = "%$keywords%";
        }

        // 是否搜索状态
        if ($state !== -1) {
            $whereSql['state'] = $state;
        }

        $filed = [
            'id', 'sort', 'keyName', 'keySource', 'keyType',
            'state', 'resultUrl', 'startTime', 'endTime',
            'createName', 'modifyTime', 'isRed', 'manModify',
            'manModifyTime'
        ];
        $orderBy = "sort ASC";
        $keysList = $this->hotKeysModel->getList($filed, $whereSql, $orderBy, null);
        $total = 0;
        $canSort = 0; //是否可以排序
        if ($keysList) {
            foreach ($keysList as $keys => &$value) {
                $value = (array)$value;
                $value['stateCn'] = HotKeysConst::STATE_MAP[$value['state']];
                // 自动化的状态显示
                if ($value['keySource']) {
                    if ($value['state'] != HotKeysConst::KEY_STATUS_DEFAULT) {
                        if (!$value['manModify']) {
                            $value['stateCn'] = "自动化-" . $value['stateCn'];
                        } else {
                            $value['stateCn'] = "人工-" . $value['stateCn'];
                        }
                    }
                } else {
                    if ($value['state'] == HotKeysConst::KEY_STATUS_ONLINE) {
                        $value['stateCn'] = "人工-" . $value['stateCn'];
                    }
                }
                $value['startTimeCn'] = $value['startTime'] ? date('Y-m-d H:i:s', $value['startTime']) : "";
                $value['endTimeCn'] = $value['endTime'] ? date('Y-m-d H:i:s', $value['endTime']) : "";
                $value['manModifyTimeCn'] = $value['manModifyTime'] ? date('Y-m-d H:i:s', $value['manModifyTime']) : "";
            }
            unset($val);
            $total = $this->hotKeysModel->count($whereSql);
            if ($allTotal > 0 && $allTotal == $total) {
                $canSort = 1;
            }
        }


        return ['results' => array_values($keysList), 'total' => $total, 'canSort' => $canSort];
    }

    /**
     * 推荐组专用(取全部)
     * @param      $inputs
     * @param bool $is_base
     * @return array
     */
    public function getBaseList()
    {
        $sale_list = [];
        $shop_list = [];
        $live_list = [];
        $indexs = [
            'sale' => 0,
            'shop' => 0,
            'live' => 0,
        ];

        $whereSql = [];
        $whereSql['isDel'] = [HotKeysConst::IS_DEL_NO];
        $whereSql['state'] = [HotKeysConst::KEY_STATUS_ONLINE];
        $filed = ['id', 'keyType', 'sort', 'keyName', 'state', 'resultUrl', 'isRed'];
        $orderBy = "sort ASC";
        $keysList = $this->hotKeysModel->getList($filed, $whereSql, $orderBy);


        // 处理拼接类别
        if ($keysList) {
            //链接埋点 作为数据上报使用
            foreach ($keysList as $key => $value) {
                $tab = (($value->keyType == HotKeysConst::TYPE_SALE) ? 'sale' :
                    (($value->keyType == HotKeysConst::TYPE_SHOP) ? 'shop' :
                        (($value->keyType == HotKeysConst::TYPE_LIVE) ? 'live' : '')));
                $keysList[$key]->resultUrl = $this->checkUrl($value->resultUrl, $value->sort, $tab, $value->keyName);
            }

            // 给推荐组接口的state=1或2,记得过滤掉
            foreach ($keysList as $key => $value) {
                unset($value->id);
                if ($value->keyType == HotKeysConst::TYPE_SALE) {
                    $sale_list[] = array_merge((array)$value, ['sort' => ++$indexs['sale']]);
                }
                if ($value->keyType == HotKeysConst::TYPE_SHOP) {
                    $shop_list[] = array_merge((array)$value, ['sort' => ++$indexs['shop']]);
                }
                if ($value->keyType == HotKeysConst::TYPE_LIVE) {
                    $live_list[] = array_merge((array)$value, ['sort' => ++$indexs['live']]);
                }

            }
            unset($value);
            // 显示输出最新的10条生效记录
            if (sizeof($sale_list) > 10) {
                $sale_list = array_slice($sale_list, 0, 10);
            }
            if (sizeof($shop_list) > 10) {
                $shop_list = array_slice($shop_list, 0, 10);
            }
            if (sizeof($live_list) > 10) {
                $live_list = array_slice($live_list, 0, 10);
            }


        }

        return ['sale' => $sale_list, 'shop' => $shop_list, 'live' => $live_list];
    }

    /**
     * 删除操作
     * @param $inputs
     * @return array
     * @throws \App\Exceptions\ApiException
     */
    public function delete($inputs)
    {
        $ids = $inputs['ids'];
        if (empty($ids)) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '无效的热词IDS');
        }

        $inputs['manModifyTime'] = time();

        // 更新
        $ids = explode(',', $ids);
        $delIds = $this->hotKeysModel->deleteByIdList($ids, $inputs);

        //记录删除的日志
        $this->HotKeysWriteLog("删除的热词ids: " . wpt_json_encode($delIds));

        return ['success' => 1, 'msg' => '操作成功'];
    }

    /**
     * 标红
     * @param $inputs
     * @return array
     * @throws \App\Exceptions\ApiException
     */
    public function setRed($inputs)
    {
        $id = $inputs['id'];
        $isSetRed = intval($inputs['isRed']);
        if (!$id > 0) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '无效的热词ID');
        }
        if (!in_array($isSetRed, [HotKeysConst::KEY_IS_RED_NO, HotKeysConst::KEY_IS_RED_YES])) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '热搜变更状态有误');
        }
        $info = $this->hotKeysModel->getOne(['id', 'state', 'startTime', 'endTime'], ['id' => $id]);
        if (empty($info)) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '热词无记录');
        }

        // 编辑词语改变状态为待发布，人工干预=1
        if ($this->checkCanSetDefaultState($info->startTime, $info->endTime, $info->state)) {
            $inputs['state'] = HotKeysConst::KEY_STATUS_DEFAULT;
        }
        $inputs['manModify'] = 1;
        $inputs['manModifyTime'] = time();

        unset($inputs['id']);
        $result = $this->hotKeysModel->updateData($inputs, ['id' => $id]);

        // 记录操作日志
        $this->HotKeysWriteLog("id:{$id}, 标记为:" . ($isSetRed ? "标红" : "取消标红") . "; 是否成功:" . ($result ? "成功" : "失败"));

        $returnDate = ['success' => 0, 'msg' => '操作失败'];
        if ($result > 0) {
            $returnDate['success'] = 1;
            $returnDate['msg'] = '操作成功';
        }
        return $returnDate;
    }

    /**
     * 设置时间区间
     * @param $inputs
     * @return array
     * @throws \App\Exceptions\ApiException
     */
    public function setTimeRange($inputs)
    {
        $id = $inputs['id'];
        unset($inputs['id']);
        $startTime = $inputs['startTime'];
        $startTime = $startTime ?: time();
        $endTime = $inputs['endTime'];
        $endTime = $endTime ?: strtotime(HotKeysConst::TIME_FOR_EVER);
        if (!$id) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '无效的热词ID');
        }
        if ($startTime >= $endTime) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '开始时间不能大于等于结束时间');
        }
        if ($endTime > HotKeysConst::TIME_FOR_EVER_UNIX) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '结束时间不能大于:' . HotKeysConst::TIME_FOR_EVER);
        }

        $info = $this->hotKeysModel->getOne([
            'id', 'startTime', 'endTime', 'manModify', 'manModifyTime', 'state'
        ], ['id' => $id]);
        if (!$info) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '该热词记录无存在');
        }

        $nowTime = time();

        $inputs['startTime'] = $startTime;
        $inputs['endTime'] = $endTime;
        $inputs['manModify'] = 1;
        $inputs['manModifyTime'] = $nowTime;

        if ($this->checkCanSetDefaultState($inputs['startTime'], $inputs['endTime'], $info->state)) {
            $inputs['state'] = HotKeysConst::KEY_STATUS_DEFAULT;
        }

        $result = $this->hotKeysModel->updateData($inputs, ['id' => $id]);

        // 记录操作日志
        $this->HotKeysWriteLog("更新时间区间, id:{$id}, 原时间:" . wpt_json_encode($info) . "; 新时间:" . wpt_json_encode($inputs));

        $returnDate = ['success' => 0, 'msg' => '操作失败'];
        if ($result > 0) {
            $returnDate['success'] = 1;
            $returnDate['msg'] = '操作成功';
        }
        return $returnDate;
    }

    /**
     * 排序
     * @param $inputs
     * @return array
     * @throws \App\Exceptions\ApiException
     */
    public function sort($inputs)
    {
        $sort = $inputs['sort'];
        $dragId = $inputs['id'];
        unset($inputs['sort'], $inputs['id']);
        if (empty($sort)) {
            CommonUtil::throwException(ErrorConst::PARAMETER_ERROR, '无效的排序字段');
        }

        // 编辑词语改变状态为待发布，人工干预=1
        $inputs['manModify'] = 1;
        $inputs['manModifyTime'] = time();

        //排序逻辑
        $idList = explode(',', $sort);
        $result = $this->hotKeysModel->_listSortByIdList($idList, $dragId, $inputs);
        if (check_error_rst($result)) {
            return ['success' => 0, 'msg' => $result['errmsg']];
        }

        $realIds = $result['data']['ids'];
        $this->HotKeysWriteLog("调用拖拽排序接口#最新排序为：" . wpt_json_encode($realIds));

        $returnDate = ['success' => 0, 'msg' => '操作失败'];
        if ($result) {
            $returnDate['success'] = 1;
            $returnDate['msg'] = '操作成功';
        }

        return $returnDate;
    }

    /**
     * 下线过期热词 command的逻辑
     * @param $inputs
     * @return array
     */
    public function _makeKeysOffLineCommand($inputs)
    {
        $nowTime = $inputs['nowTime'];
        /**
         * 一.查询符合下线条件的IdList
         * 1.state=1
         * 2.当前时间大于【词结束时间】#$endTime < $nowTime
         */
        $whereSql = [];
        $whereSql['endTime <'] = $nowTime;
        $whereSql['state'] = HotKeysConst::KEY_STATUS_ONLINE;
        $whereSql['isDel'] = HotKeysConst::IS_DEL_NO;
        $filed = ['id', 'keyName', 'keyType', 'state', 'endTime'];
        $orderBy = "id DESC";
        $keyList = $this->hotKeysModel->getList($filed, $whereSql, $orderBy);
        $idList = array_column($keyList, 'keyName', 'id');

        /**
         * 二.下线处理
         */
        $updatedIds = $this->hotKeysModel->hotKeysOffLineProcessByIdList(array_keys($idList));

        /**
         * 三.记录日志
         */
        if (!empty($updatedIds)) {
            foreach ($updatedIds as $id) {
                $msg = "id:{$id}, 关键词：{$idList[$id]}, 结束时间：{$idList[$id]}, 状态从已发布->已下线";
                $this->HotKeysWriteLog($msg, true);
            }
        }

        $set = [
            'ids'   => $updatedIds,
            'count' => sizeof($updatedIds)
        ];
        return $set;
    }

    /**
     * 使生效处理逻辑 command的逻辑
     * @param $inputs
     * @return array
     */
    public function _makeKeysOnLineCommand($inputs)
    {
        $nowTime = $inputs['nowTime'];
        /**
         * 一.查询符合上线条件的idList
         * 1、state=0
         * 2、当前时间在热词有效时间区间#$startTime <=$nowTime <= $endTime
         */
        $whereSql = [];
        $whereSql['startTime <='] = $nowTime;
        $whereSql['endTime >='] = $nowTime;
        $whereSql['isDel'] = HotKeysConst::IS_DEL_NO;
        $whereSql['state'] = HotKeysConst::KEY_STATUS_DEFAULT;
        $filed = ['id', 'keyName', 'keyType', 'state', 'endTime'];
        $orderBy = "id DESC";
        $keyList = $this->hotKeysModel->getList($filed, $whereSql, $orderBy);
        $idList = array_column($keyList, 'keyName', 'id');
        /**
         * 二.上线逻辑
         */
        $updatedIds = $this->hotKeysModel->hotKeysOnLineProcessByIdList(array_keys($idList));
        /**
         * 三.记录日志
         */
        foreach ($updatedIds as $id) {
            $msg = "id:{$id}, 关键词：{$idList[$id]}, 状态从待发布->已经发布";
            $this->HotKeysWriteLog($msg, true);
        }

        $set = [
            'ids'   => $updatedIds,
            'count' => sizeof($updatedIds)
        ];
        return $set;
    }

    /**
     * 直播间热词进入热词库 command的逻辑
     * @param $inputs
     * @return array
     */
    public function _getLiveHotKeysCommand()
    {
        // 后端一组的接口，获取直播的热搜词
        //todo 上线的时候改为env配置
        $getUrl = env('WPT_API_INSIDE_HOST') . "inside/v1.0/live/get-hot-keyword-n";

        if (env('APP_ENV') == 'TEST') {
            $getUrl = "http://apit.weipaitang.com/inside/v1.0/live/get-hot-keyword-n";
        }

        // 1、接受数据
        $result = curl_http_get($getUrl);
        $this->HotKeysWriteLog("拉取直播热词数据:" . wpt_json_encode($result), true);


        // 拉取直播数据
        $hotKeywordList = $result['data'] ?? [];
        if (empty($hotKeywordList)) {
            return ['result' => false, 'json' => "无直播数据"];
        }

        // 2、先获取数据里已有的直播类型自动化热词
        $existLivekeyList = $this->hotKeysModel->getNameByIdsWithLiveGenerate();
        $existKeyWords = array_keys($existLivekeyList);

        // 3、删除被剔除的热词，添加新词，最终更新排序
        if (!empty($hotKeywordList)) {

            // 3.1 获取删除的热词
            $delKeyWords = array_diff($existKeyWords, $hotKeywordList);
            $updateKeyWords = array_intersect($existKeyWords, $hotKeywordList);
            $addKeyWords = array_diff($hotKeywordList, $existKeyWords);

            // 3.2 去除删除的id集合
            $delIds = [];
            foreach ($delKeyWords as $v) {
                $delIds[] = $existLivekeyList[$v];
            }
            if (!empty($delIds)) {
                $delRealIds = $this->hotKeysModel->deleteByIdList($delIds);
                $this->HotKeysWriteLog("删除直播热词#ids:" . wpt_json_encode($delRealIds), true);
            }

            // 3.3 添加新的
            $nowTime = time();
            foreach ($addKeyWords as $v) {
                $newId = $this->hotKeysModel->insertData([
                    'keyName'       => $v,
                    'keySource'     => HotKeysConst::KEY_SOURCE_AUTO,
                    'keyType'       => HotKeysConst::TYPE_LIVE,
                    'sort'          => array_search($v, $hotKeywordList),
                    'state'         => HotKeysConst::KEY_STATUS_ONLINE,
                    'manModify'     => 0,
                    'manModifyTime' => 0,
                    'createTime'    => $nowTime,
                    'startTime'     => $nowTime,
                    'endTime'       => strtotime(HotKeysConst::TIME_FOR_EVER),
                ]);

                $this->HotKeysWriteLog("新增直播热词#id:{$newId}", true);
            }

            // 3.4 更新sort
            foreach ($updateKeyWords as $v) {
                $this->hotKeysModel->updateData([
                    'sort'          => array_search($v, $hotKeywordList),
                    'createName'    => '',
                    'manModify'     => 0,
                    'manModifyTime' => 0,
                    'state'         => HotKeysConst::KEY_STATUS_ONLINE,
                    'createTime'    => $nowTime,
                    'startTime'     => $nowTime,
                    'isRed'         => 0,
                    'resultUrl'     => '',
                    'createDDId'    => '',
                    'endTime'       => strtotime(HotKeysConst::TIME_FOR_EVER),
                ], ['id' => $existLivekeyList[$v]]);
            }

            // 3.5 直播词加到人工直播热词后
            $existLivekeyListByUser = $this->hotKeysModel->getNameByIdsWithUserAdd();

            $maxSort = sizeof($hotKeywordList);
            foreach ($existLivekeyListByUser as $item) {
                ++$maxSort;
                $itemId = $item['id'];

                $this->hotKeysModel->updateData([
                    'sort' => $maxSort
                ], ['id' => $itemId]);

                $this->HotKeysWriteLog("把直播词加到手动词后#更新排序#id:{$itemId},sort:{$maxSort}", true);
            }
        }

        $set = [
            'result' => true,
            'count'  => sizeof($hotKeywordList),
        ];
        return $set;
    }

    /**
     * 记录日志
     * @param string $msg
     * @param bool   $cmd
     * @throws \Exception
     */
    public function HotKeysWriteLog($msg = '', $cmd = false)
    {
        $author = $cmd ? "系统" : $this->userDDInfo->ddName;
        $message = $author . "::" . $msg;
        WriteLog::info('hotkeys', 'log', $message, "search/hotkeys/log");
    }

    /**
     * 是否需要设置新状态
     * @param $inputs
     * @param $newState
     */
    private function checkCanSetDefaultState($startTime, $endTime, $oldState)
    {
        $nowTime = time();

        // 过期判断
        if ($nowTime > $endTime) {
            return false;
        }

        // 生效时间判断
        if ($nowTime < $endTime && $nowTime > $startTime) {
            if ($oldState == HotKeysConst::KEY_STATUS_ONLINE) {
                return false;
            }
            if ($oldState == HotKeysConst::KEY_STATUS_OFFLINE) {
                return true;
            }
        }

        // 未来将生效判断
        if ($nowTime < $startTime) {
            return true;
        }
    }

    /**
     * url处理
     * @param $url
     * @param $params
     * @return string
     */
    private function checkUrl($url, $params, $tab, $keyword)
    {
        $preg = "/^http(s)?:\\/\\/.+/";
        if (empty($url)) {
            $newUrl = '';
        } else if (!empty($url) && !preg_match($preg, $url)) {
            $newUrl = $url;
        } else if (!empty($url) && preg_match($preg, $url)) {
            $check = strpos($url, '?');
            if ($check !== false) {
                //如果 ? 后面没有参数，如 http://www.baidu.com/index.php?
                if (substr($url, $check + 1) == '') {
                    //可以直接加上附加参数
                    $newUrl = $url . 'searchType=hot&tab=' . $tab . '&hotSearchNum=' . $params . '&keyword=' . urlencode($keyword);
                } else {
                    $newUrl = $url . '&searchType=hot&tab=' . $tab . '&hotSearchNum=' . $params . '&keyword=' . urlencode($keyword);
                }
            } else {
                $newUrl = $url . '?searchType=hot&tab=' . $tab . '&hotSearchNum=' . $params . '&keyword=' . urlencode($keyword);
            }
        }


        return $newUrl;

    }
}