<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 8/12/21
 * @version 1.0
 */
namespace App\Http\Controllers\Admin\Xcx;

use App\Http\Controllers\Admin\CController;
use App\Repositorys\BlogsRepository;
use Illuminate\Http\Request;
class XcxBlogController extends CController
{
    public function __construct()
    {
        $this->blogsRepository = new BlogsRepository();
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function blogs(Request $request){
        $this->validate($request, [
            'page' => 'required|integer:min:1',
            'page_size' => 'required|in:10,20,30,50,100',
        ]);
        $result = $this->blogsRepository->getBlogs($request->page, $request->page_size);
        $this->_formartBlogs($result['rows']);
        return $this->success($result);
    }

    private function _formartBlogs(& $rows){
        foreach ($rows as &$it){
            $it['create_time'] = date('Y-m-d H:i:s', $it['create_time']);
        }
    }

}