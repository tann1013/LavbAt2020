<?php

namespace App\Repositorys;

use App\Models\BillModel;

/**
 * Class UserRepository
 *
 * @package App\Repositorys
 */
class BillRepository
{
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
}
