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
        return $this->success($result);
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
}