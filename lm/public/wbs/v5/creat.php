<?php
include_once "SERVER.class.php";
include_once "libs/V5SoapDiscovery.class.php";

//demo1,生成SERVER.wsdl文件
//$wsdl = new SoapDiscovery('SERVER','SERVER');
//$wsdl -> getWSDL();

//demo2
/**
 * SERVER 类名
 * sample2 服务名称
 */
$wsdl = new V5SoapDiscovery('SERVER','sample2');
$wsdl -> getWSDL();