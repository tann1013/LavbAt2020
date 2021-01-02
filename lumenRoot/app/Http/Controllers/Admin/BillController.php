<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-01-02
 * @version 1.0
 */

namespace App\Http\Controllers\Admin;


use App\Repositorys\BillRepository;
use Illuminate\Http\Request;

class BillController extends CController
{
    public function __construct(BillRepository $billRepository)
    {
        $this->billRepository = $billRepository;
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function jz(Request $request){
        $this->validate($request, [
            'addtime' => 'string',
            'op_eat' => 'string',
        ]);
        $this->billRepository->insertBill($request->all());
        return $this->success([], '添加成功...');

    }
}