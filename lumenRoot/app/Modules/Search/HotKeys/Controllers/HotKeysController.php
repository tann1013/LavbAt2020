<?php
/**
 * @author tanj@weipaitang.com
 * @date   2019-05-31 14:23
 */

namespace App\Modules\Search\HotKeys\Controllers;

use App\Http\Controllers\BaseController;
use App\Modules\Search\HotKeys\Consts\HotKeysConst;
use App\Modules\Search\HotKeys\Logics\HotKeysLogic;
use Illuminate\Http\Request;

class HotKeysController extends BaseController
{
    private $hotKeyLogic;

    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->hotKeyLogic = new HotKeysLogic();
    }

    /**
     * 列表
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getList(Request $request)
    {
        $inputs['keyType'] = intval($request->input('keyType', 1));
        $inputs['keywords'] = trim($request->input('keywords', ''));
        $inputs['state'] = intval($request->input('state', -1));
        return wmResponse()->json($this->hotKeyLogic->getList($inputs));
    }

    /**
     * 列表拖拽排序接口
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sort(Request $request)
    {
        $inputs = [];
        $inputs['sort'] = $request->input('sort', '');
        $inputs['id'] = $request->input('id', 0);
        $inputs['createName'] = $this->userDDInfo->ddName;
        $inputs['createDDId'] = $this->userDDInfo->ddId;
        return wmResponse()->json($this->hotKeyLogic->sort($inputs));
    }

    /**
     * 列表(推荐组专用,建议加上缓存)
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function baseList(Request $request)
    {
        return wmResponse()->json($this->hotKeyLogic->getBaseList());
    }

    /**
     * 创建热词
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create(Request $request)
    {
        $inputs = [];
        $inputs['keyName'] = trim($request->input('keyName', ''));
        //默认为拍品
        $inputs['keyType'] = intval($request->input('keyType'));
        $inputs['keyType'] = empty($inputs['keyType']) ? HotKeysConst::TYPE_SALE : $inputs['keyType'];
        //起始时间设置-开始时间默认为当前
        $inputs['startTime'] = intval($request->input('startTime', 0));
        $inputs['startTime'] = !$inputs['startTime'] ? time() : $inputs['startTime'];
        //起始时间设置-开始时间默认长期
        $inputs['endTime'] = intval($request->input('endTime', 0));
        $inputs['endTime'] = !$inputs['endTime'] ? strtotime(HotKeysConst::TIME_FOR_EVER) : $inputs['endTime'];
        //默认关闭
        $inputs['isSetRed'] = intval($request->input('isSetRed', 0));

        $inputs['resultUrl'] = trim($request->input('resultUrl', ''));
        $inputs['createName'] = $this->userDDInfo->ddName;
        $inputs['createDDId'] = $this->userDDInfo->ddId;

        return wmResponse()->json($this->hotKeyLogic->addHotKey($inputs));
    }

    /**
     * 删除（兼容批量）
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(Request $request)
    {
        $inputs = [];
        $inputs['ids'] = $request->input('ids');
        $inputs['createName'] = $this->userDDInfo->ddName;
        $inputs['createDDId'] = $this->userDDInfo->ddId;
        return wmResponse()->json($this->hotKeyLogic->delete($inputs));
    }

    /**
     * 设置/取消热搜（标红）
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function setRed(Request $request)
    {
        $inputs = [];
        $inputs['id'] = $request->input('id');
        $inputs['isRed'] = $request->input('isSetRed', 0);
        $inputs['createName'] = $this->userDDInfo->ddName;
        $inputs['createDDId'] = $this->userDDInfo->ddId;
        return wmResponse()->json($this->hotKeyLogic->setRed($inputs));
    }

    /**
     * 设置时间区间
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function setTimeRange(Request $request)
    {
        $inputs = [];
        $inputs['id'] = $request->input('id');
        $inputs['startTime'] = intval($request->input('startTime', 0));
        $inputs['endTime'] = intval($request->input('endTime', 0));
        $inputs['createName'] = $this->userDDInfo->ddName;
        $inputs['createDDId'] = $this->userDDInfo->ddId;
        return wmResponse()->json($this->hotKeyLogic->setTimeRange($inputs));
    }
}