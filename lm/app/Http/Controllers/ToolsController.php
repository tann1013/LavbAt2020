<?php
namespace App\Http\Controllers;



use App\Helpers\Excel;
use App\Http\Controllers\Admin\BillController;
use App\Imports\ImportForReportAnquanCheck;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ToolsController extends Controller
{

    public function tools(Request $request){
        return view('tools', []);
    }

    public function toolsHandle(Request $request){
        //解析Excel且入库

        //1 inputs
        if(!$request->hasFile('excel')) {
            return $this->fail('please upload Excel！');
        }
        //2 logic
        $path = $request->file('excel');

        $userArr = [];
        //@TODO 导入Excel
        //方式1
        //Excel::import(new ImportForReportAnquanCheck($userArr), $path);
        //方式2
        $excelArr = Excel::import($path);
        //2 处理数据
        if($excelArr){
            unset($excelArr[1]);
            unset($excelArr[2]);
            foreach ($excelArr as $itArr){
                $handleItem = [];
                $tableMapps = BillController::TABLE_MAPPS;
                $mapps = array_keys($tableMapps);
                foreach ($itArr as $k=>$v){
                    $setKey = $mapps[$k];
                    $handleItem[$setKey] = trim($v);
                }

                $theExcelDate = ($handleItem['addtime']-25569)*24*3600;

                $handleItem['addtime'] = date('Y-m-d', $theExcelDate);
                //特殊处理
                $handleItem['add_month'] = date('Y-m', $theExcelDate);
                $handleItem['uid'] = 110;//导入
                $handleItem['total'] =(float) $handleItem['op_eat']+(float) $handleItem['op_traffic']+(float) $handleItem['op_other'];

                DB::table('bage_bill')->insertGetId($handleItem);
            }
        }


        //3 response
        return $this->success(true, '导入成功！');
    }



    /**
     * @param $userArr
     * @param $path
     * @return bool
     */
    private function _doImport($path){
        try{
            //
        }catch (\Exception $e){
            return array('code'=>-1,'msg'=>$e->getMessage());
        }
        return array('code'=>0,'msg'=>'入库成功');
    }
}