<?php

namespace App\ConstDir;


class BaseConst
{
    //默认每页数量
    const PAGE_NUM = 10;
    //成功标志
    const SUCCESS_CODE = 200;
    const SUCCESS_CODE_MSG = 'success';
    //失败标志
    const ERROR_CODE = -100;
    const ERROR_CODE_MSG = 'error';

    //未查询到该ID的记录信息
    const NOT_IN_DB_CODE = -101;
    const NOT_IN_DB_MSG = '未查询到该ID的记录信息!';

    const NOT_IN_DB_BILLNUM_CODE = -201;
    const NOT_IN_DB_BILLNUM_MSG = '该发票已添加过了!';

}