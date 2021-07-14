<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-01-02
 * @version 1.0
 */

namespace App\Http\Controllers\Admin;


use App\Repositorys\BillRepository;
use App\Repositorys\TaskRepository;
use Illuminate\Http\Request;

class BillController extends CController
{
    const TABLE_MAPPS = [
        'addtime' => '日期',
        'op_eat' => '吃',
        'op_traffic' => '交通',
        'op_other' => '其他',
        'op_other_notes' => '其他备注',
        'op_today_profit' => '收益',
        'op_today_reading' => '收益备注',
        'op_today_running' => '读书',
        'every_month_wages' => '跑步',
        'op_today_profit_notes' => 'situp',
    ];

    public function __construct(BillRepository $billRepository)
    {
        $this->billRepository = $billRepository;
        $this->taskRy = new TaskRepository();
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function jz(Request $request){
        $this->validate($request, [
            'addtime' => 'required',
            'op_eat' => 'required',
        ]);
        //dd($request->all());
        if($this->billRepository->setBill($request->all())){
            return $this->success([], '添加成功...');
        }else{
            return $this->fail('添加失败...');
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function getList(Request $request){
        $page = $request->input('page', 1);
        $page_size = $request->input('page_size', 10);
        $this->validate($request, [
            'page' => 'required|integer:min:1',
            'page_size' => 'required|in:10,20,30,50,100',
        ]);
        $result = $this->billRepository->findAllBills($page, $page_size);
        $result = $this->_formatGetList($result);
        return $this->success($result);
    }


    private function _addStrForItem(& $item){
        foreach ($item as &$it){
            $it['total'] = '-'.$it['total'];
            $it['op_today_profit'] = '+'.$it['op_today_profit'];
        }
    }

    /**
     * 计算漏记天数
     * @param $thisMonthArr
     * @param $keyM
     * @return int
     */
    private function _getMissingDay($thisMonthArr, $keyM){
        //本月天数
        $start_day = date('Ym01', strtotime($keyM));
        $end_day   = date('Ymd', strtotime("{$start_day} + 1 month -1 day"));
        $thisMonthRange =  range($start_day, $end_day, 1);
        $thisMonthDays = sizeof($thisMonthRange);

        //已记录天数
        $jlDays = sizeof($thisMonthArr);
        $num = $thisMonthDays - $jlDays;
        return $num;
    }
    
    private function _formatGetList($result){
        $newRows = [];
        if($rows = $result['rows']){
            $rowsGroupByAddM = _arrayGroupByCellKey($rows, 'add_month');
            //dd($rowsGroupByAddM);
            foreach ($rowsGroupByAddM as $keyM => $item){
                //增加+-符号
                $this->_addStrForItem($item);

                //漏记天数
                $ljNum = $this->_getMissingDay($item, $keyM);

                //1 monthData
                $thisMonthData = [
                    "id" => time(),
                    "op_eat" => '',
                    "op_traffic" => '',
                    "op_other" => '',
                    "op_other_notes" => '记录为'.$keyM.'（已漏记'.$ljNum.'天）。',
                    "total" => '',
                    "op_today_profit" => '',
                    "op_today_profit_notes" => '',
                    "op_today_reading" => '',
                    "op_today_running" => '',
                    "addtime" => '',
                    "add_month" => '',
                ];
                //合并
                $thisRow = array_merge([$thisMonthData], $item);
                $newRows = array_merge($newRows, $thisRow);

            }
            $result['rows'] = $newRows;
        }
        return $result;
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function getTaskList(Request $request){
        $page = $request->input('page', 1);
        $page_size = $request->input('page_size', 10);
        $this->validate($request, [
            'page' => 'required|integer:min:1',
            'page_size' => 'required|in:10,20,30,50,100',
        ]);

        $result = $this->taskRy->findRows($page, $page_size);
        return $this->success($result);
    }

    public function addTask(Request $request){
        $this->validate($request, [
            'title' => 'required',
            'content' => 'required',
            'create_time' => 'required',
        ]);
        //dd($request->all());
        if($this->taskRy->setTask($request->all())){
            return $this->success([], '添加成功...');
        }else{
            return $this->fail('添加失败...');
        }
    }

    //createTask、editTask

}