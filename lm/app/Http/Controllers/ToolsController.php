<?php
namespace App\Http\Controllers;



use Illuminate\Http\Request;

class ToolsController extends Controller
{
    public function tools(Request $request){
        if($_SERVER['REQUEST_METHOD']=='POST'){
            //解析Excel且入库
            //1 inputs
            if(!$request->hasFile('excel')) {
                return $this->fail('请上传Excel附件！');
            }
            //2 logic

            $path = $request->file('excel');
            $res = $this->_doImport($path);
            if($res['code']<0){
                return $this->fail($res['msg']);
            }

            //3 response
            return $this->success(true, '导入成功！');




        }else{
            return view('tools', []);
        }
    }

    /**
     * @param $userArr
     * @param $path
     * @return bool
     */
    private function _doImport($userArr, $path){
        try{
            \Maatwebsite\Excel\Facades\Excel::import(new ImportForReportAnquanCheck($userArr), $path);

        }catch (\Exception $e){
            return array('code'=>-1,'msg'=>$e->getMessage());
        }
        return array('code'=>0,'msg'=>'入库成功');
    }
}