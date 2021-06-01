<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 6/1/21
 * @version 1.0
 */

class SERVER{
    public function HelloWorld(){
        return "Hello World!" . __FILE__;
    }
}



$objSoapServer = new SoapServer("SERVER.wsdl");
$objSoapServer->setClass("SERVER");//注册类,SERVER
$objSoapServer->handle();