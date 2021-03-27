<?php

namespace App\Repositorys;

use App\Models\TaskModel;
use App\Traits\PagingTrait;
use Illuminate\Support\Facades\DB;

/**
 * Class UserRepository
 *
 * @package App\Repositorys
 */
class TaskRepository
{
    use PagingTrait;

    public $table = 'lavb_task';

    public function insertBill(array $data){
        try {
            $result = new TaskModel();
            $result->uid = 101;
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
    public function findRows(int $page, int $page_size, array $params = []){
        //$rowObj = BillModel::select(['id', 'op_eat as name', 'op_eat']);
        //吃饭交通其他
        $columsArr = ['id',
            'title',
            'status',
            'create_time'
        ];
        $rowObj = TaskModel::select($columsArr);
        $total = $rowObj->count();
        $rows = $rowObj->orderBy('create_time', 'desc')->forPage($page, $page_size)->get()->toArray();
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
