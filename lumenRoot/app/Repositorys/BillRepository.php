<?php

namespace App\Repositorys;

use App\Models\BillModel;
use App\Traits\PagingTrait;

/**
 * Class UserRepository
 *
 * @package App\Repositorys
 */
class BillRepository
{
    use PagingTrait;

    /**
     * 通过用户ID查询用户信息
     *
     * @param int $user_id 用户ID
     * @param array $field 数据字段
     * @return User|null
     */
    public function findById($user_id, $field = ['*'])
    {
        //return User::where('id', $user_id)->first($field);
    }

    public function insertBill(array $data){
        try {
            $result = new BillModel();
            $result->uid = 101;
            $result->addtime = $data['addtime'];
            $result->op_eat = $data['op_eat'];
            $result->op_traffic = $data['op_traffic'];
            $result->op_other = $data['op_other'];
            $result->op_other_notes = $data['op_other_notes'];
            $result->total = $data['total'];

            $result->op_today_profit = $data['op_today_profit'];
            $result->op_today_reading = $data['op_today_profit'];
            $result->every_month_wages = $data['every_month_wages'];//工资

            return $result->save();
        } catch (\Exception $e) {
            return false;
        }
    }

//
//`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
//`uid` int(2) DEFAULT NULL,
//`op_eat` int(2) DEFAULT NULL,
//`op_traffic` int(2) DEFAULT NULL,
//`op_other` int(2) DEFAULT NULL,
//`op_other_notes` varchar(200) DEFAULT NULL,
//
//
    /**
     * 查询角色列表
     *
     * @param int $page 分页数
     * @param int $page_size 分页大小
     * @param array $params 查询参数
     * @return array
     */
    public function findAllBills(int $page, int $page_size, array $params = [])
    {
        //$rowObj = BillModel::select(['id', 'op_eat as name', 'op_eat']);
        $rowObj = BillModel::select(['id', 'op_eat as name', 'op_eat', 'op_other', 'addtime as created_at', 'addtime as updated_at']);



        $total = $rowObj->count();

        $rows = $rowObj->orderBy('id', 'desc')->forPage($page, $page_size)->get()->toArray();
        return $this->getPagingRows($rows, $total, $page, $page_size);
    }
}
