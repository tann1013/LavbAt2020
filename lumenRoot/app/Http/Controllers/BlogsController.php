<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2020-12-01
 * @version 1.0
 */

namespace App\Http\Controllers;


use App\Http\Controllers\Admin\CController;
use App\Models\BlogsModel;
use App\Repositorys\BlogsRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BlogsController extends CController
{
    const NO_DATA_ERR_CODE = -1113;//查询不到相关信息
    const CHECK_INPUTS_ERR_CODE = -1;//参数校验错误

    protected  $blogsRepository;
    protected  $limit = 11;

    /**
     * StandardTechController constructor.
     * @param StandardTechDb $standardTech
     */
    public function __construct(BlogsRepository $blogsRepository)
    {
        //parent::__construct();
        $this->blogsRepository = $blogsRepository;
    }

    /**
     * @param Request $request
     * @return array
     */
    public function getList(Request $request){
        //1 getInputs
        $page = $request->input('page','0');//页
        $size = $request->input('size',$this->limit);//条数

        //2 logic
        $inputs = array();
        $data = $this->blogsRepository->getBlogs($page, $size, $inputs);

        //3 response
        if(empty($data) ){
            //return $this->toWebJson(-3);
        }

        //dd($data);

        return view('indexV2', ['data' => $data]);
    }

    /**
     * @param Request $request
     */
    public function add(Request $request){
    }

    /**
     * @param Request $request
     * @return array
     */
    public function modify(Request $request){
    }

    /**
     * @param Request $request
     * @return array
     */
    public function del(Request $request){
    }

    /**
     * @param $data
     */
    private function _transformDta(& $data){
        //是否有子集
        if($data){
            foreach ($data as $item){
                //判断是否有子数据
                $cnt = $this->db->_count(['parent_id' => $item->id]);
                $item->isChildren = $cnt>0 ? true : false;
            }
        }
    }
}