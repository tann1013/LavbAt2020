<?php
/**
 * @author tanj@weipaitang.com
 * @date   2019-05-31 15:08
 */

namespace App\Modules\Search\HotKeys\Requests;

use App\Http\Requests\BaseRequest;
use App\Http\Requests\ResultRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HotKeysRequest extends BaseRequest
{
    /**
     * 类型和关键词为必填项
     * @param Request $request
     * @return ResultRequest
     */
    public function create(Request $request): ResultRequest
    {
        $validator = Validator::make($request->all(), [
            'keyName'  => 'string|min:1|max:50', //关键词
            'keyType'  => 'required|integer|in:1,2,3', // 分类名称
            'isSetRed' => 'integer',
        ], [
            'keyName.*'  => '关键词不符合规范，最大不超过50个字符',
            'keyType.*'  => '请输入正确的类别',
            'isSetRed.*' => '请选择是否标红',
        ]);

        if ($validator->fails()) {
            return $this->response(false, ['msg' => $validator->errors()]);
        }

        return $this->response(true);
    }

    /**
     * 获取列表
     * @param Request $request
     * @return ResultRequest
     */
    public function getList(Request $request): ResultRequest
    {
        return $this->response(true);
    }

    /**
     * 提供对外的用户端获取热词的接口
     * @param Request $request
     * @return ResultRequest
     */
    public function baseList(Request $request): ResultRequest
    {
        return $this->response(true);
    }

    public function delete(Request $request): ResultRequest
    {
        return $this->response(true);
    }

    public function setRed(Request $request): ResultRequest
    {
        return $this->response(true);
    }

    public function setTimeRange(Request $request): ResultRequest
    {
        return $this->response(true);
    }

    public function sort(Request $request): ResultRequest
    {
        return $this->response(true);
    }
}