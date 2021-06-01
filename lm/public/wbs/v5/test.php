<?php

try{
    ini_set('soap.wsdl_cache_enabled','0');
    $soap = new SoapClient('http://hd2.com/tmp/v5/SERVER.php?wsdl');

    echo "<pre>";
    print_r($soap->__getFunctions());
    echo "</pre>";

//1 wsdl文件为：SERVER.wsdl的方法
echo $soap->HelloWorld();


//2 wsdl文件为：dataAccessService.wsdl的方法
    //echo $soap->dataReply();

}catch (Exception $e){
    var_dump($e->getMessage());die;
}


/*
array(1) {ÅÅÅÅÅÅÅÅÅ
    [0]=>
  string(19) "string HelloWorld()"
}
Hello World!222222222222
*/