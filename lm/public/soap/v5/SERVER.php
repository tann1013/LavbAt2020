<?php

//class SERVER{
//    public function HelloWorld(){
//        return "Hello World!222222222222";
//    }
//}
include "SERVER.class.php";

//方式一
//$objSoapServer = new SoapServer("SERVER.wsdl");

//方式二
//$wsdl='http://hd2.com/tmp/v5/sample.wsdl?wsdl';
//$objSoapServer = new SoapServer($wsdl);

//方式三,选择另外一个wsdl文件
$objSoapServer = new SoapServer("dataAccessService.wsdl");


$objSoapServer->setClass("SERVER");//注册类,SERVER
$objSoapServer->handle();