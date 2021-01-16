<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-01-14
 * @version 1.0
 */

namespace App\Models;


class BlogsModel extends BaseModel
{

    /**
     * @var string 定义表名字
     */
    protected $table = 'bage_post';

    /**
     * @param $CustomerIdList
     * @return mixed
     */
    public function _getList(){
        $list = $this->get()->toArray();
        return $list;
    }

    public function _count(){
        return 100;
    }


}