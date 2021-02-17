<?php

namespace App\Repositorys;

use App\Models\BillModel;
use App\Traits\PagingTrait;
use Illuminate\Support\Facades\DB;

/**
 * Class UserRepository
 *
 * @package App\Repositorys
 */
class BillRepository
{
    use PagingTrait;

    public $table = 'bage_bill';

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

    /**
     * 查询角色列表
     *
     * @param int $page 分页数
     * @param int $page_size 分页大小
     * @param array $params 查询参数
     * @return array
     */
    public function findAllBills(int $page, int $page_size, array $params = []){
        //$rowObj = BillModel::select(['id', 'op_eat as name', 'op_eat']);
        //吃饭交通其他
        $columsArr = ['id',
            'op_eat',
            'op_traffic',
            'op_other',
            'op_other_notes',
            'total',
            'op_today_profit',
            'op_today_reading',
            'op_today_running',
            'addtime'
        ];
        $rowObj = BillModel::select($columsArr);
        $total = $rowObj->count();
        $rows = $rowObj->orderBy('addtime', 'desc')->forPage($page, $page_size)->get()->toArray();
        return $this->getPagingRows($rows, $total, $page, $page_size);
    }

    private function _save($data){
        return DB::table($this->table)->insertGetId($data);
    }

    private function _update($id, $toUpdate){
        return DB::table($this->table)->where('id', $id)->update($toUpdate);
    }

    private function _del($id){
        return DB::table($this->table)->where('id', $id)->delete();
    }

    private function _getDetail($id){
        return DB::table($this->table)->where(['id'=>$id])->get()->first();
    }

    private function _getDetailByWhere($where){
        return DB::table($this->table)->where($where)->get()->first();
    }

    /**
     * @param array $data
     * @return int
     */
    public function setBill(array $data){
        unset($data['s']);
        $data['uid'] = 101;

        $detail = $this->_getDetailByWhere(['addtime' => $data['addtime']]);
        if($detail){
            return $this->_update($detail->id, $data);
        }else{
            return $this->_save($data);
        }
    }
}
