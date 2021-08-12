<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-01-14
 * @version 1.0
 */

namespace App\Repositorys;


use App\Models\BlogsModel;
use App\Traits\PagingTrait;

class BlogsRepository
{
    use PagingTrait;
    /**
     * 获取管理员列表
     *
     * @param int $page 分页数
     * @param int $page_size 分页大小
     * @param array $params 查询参数
     * @return array
     */
    public function getBlogs(int $page, int $page_size, array $params = [])
    {
        $rowObj = BlogsModel::select(['id', 'title', 'intro', 'tags', 'create_time']);

        $orderBy = 'id';
        $sort = 'desc';
        if (isset($params['order_by'], $params['sort'])) {
            $orderBy = $params['order_by'];
            $sort = $params['sort'];
        }

        if (isset($params['username']) && !empty($params['username'])) {
            $rowObj->where('username', 'like', "%{$params['username']}%");
        }

        if (isset($params['status'])) {
            $rowObj->where('status', $params['status']);
        }

        //$rowObj->where('is_delete', Admin::NO_DELETE);

        $total = $rowObj->count();
        $rows = $rowObj->orderBy($orderBy, $sort)->forPage($page, $page_size)->get()->toArray();
        return $this->getPagingRows($rows, $total, $page, $page_size);
    }

    /**
     * @param $user_id
     * @param array $field
     * @return mixed
     */
    public function getDetail($id, $field = ['*'])
    {
        return BlogsModel::where('id', $id)->first($field);
    }


}