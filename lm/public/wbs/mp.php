<?php
/**
 * 模拟南自服务端
 */

const KUNSHI_REC_URL = 'http://hd2.com/wbs/SERVER.php';

function _writeLog($content){
//    $path =  __DIR__ . '/wbs-'.date('Y-m-d').'.log';
    $path = __DIR__ . '/wbs.log';
    file_put_contents($path, ''.date('Y-m-d H:i:s', time()).' '.$content.PHP_EOL, FILE_APPEND);
}

/**
 * @param $reqId
 */
function _sendJsonData2ks($reqId = 0){

    /**
     * 1 配置
     */
    $withXml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><soapenv:Body><ns1:dataReq soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns1=\"http://tempuri.org/\"><ns1:arg0 xsi:type=\"soapenc:string\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><replyDataMsg><replyId>$reqId</replyId><facName>hd</facName><replyFlag>1</replyFlag><replyData>[{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-日发电量\",\"num\":\"1\",\"value\":\"3628.42\"},{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-累计发电量\",\"num\":\"2\",\"value\":\"7.15178e+06\"},{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-总SO2减排\",\"num\":\"3\",\"value\":\"214553\"},{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-总NOx减排\",\"num\":\"4\",\"value\":\"107277\"},{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-总减排标煤量\",\"num\":\"5\",\"value\":\"2.86071e+06\"},{\"datasource\":\"上海创智园光伏站\",\"name\":\"光伏区-cpu-输出总有功功率\",\"num\":\"6\",\"value\":\"0\"}]</replyData></replyDataMsg></ns1:arg0></ns1:dataReq></soapenv:Body></soapenv:Envelope>";
    /**
     * 2 实例化
     */
    $wsdlUrl = KUNSHI_REC_URL;
    //ini_set('soap.wsdl_cache_enabled','0');
    $soap = new \SoapClient($wsdlUrl);
    //2.1 携带xml(ok)
    $response = $soap->__doRequest($withXml, $wsdlUrl, 'getAlogpsResults',1,0);//发送xml必须使用__doRequest

    //3 判断是否成功
    var_dump($response);die;
}

/**
 * @param $xmlStrem
 * @return array
 */
function _stepGetReqId($xmlStrem){
    //1 解析

    //解析，$replyId
    preg_match_all('/<reqId>(.*)<\/reqId>/',$xmlStrem, $prs_id);

    //_writeLog(var_export($prs_id));die;

    $replyId = isset($prs_id[1][0]) ? $prs_id[1][0] : '';

    if(empty($replyId)){
        //_writeLog('本次未解析到$replyId！');
    }

    return $replyId;
}

/**
 * @param $jsonStr
 * @return mixed
 */
function _filterSpecialChar($jsonStr){
    //1 去掉反斜线字符
    $jsonStr = stripslashes($jsonStr);
    //2 去掉尾部的\n
    $jsonStr = str_replace("\n", "", $jsonStr);
    //3 去掉\x00
    $jsonStr = str_replace("\x00", "", $jsonStr);
    return $jsonStr;
}

try{



    //header("Content-Type: text/html;charset=utf-8");
    _writeLog('开始处理坤时的请求...');

    _writeLog('--坤时请求withXml数据--');
    //_writeLog(var_export($_SERVER, true));
    $ks_xmlstrem = file_get_contents("php://input");
    _writeLog($ks_xmlstrem);


    /**
     * 解析得到$replyId
     */
    $ks_xmlstrem = _filterSpecialChar($ks_xmlstrem);
    $reqId = _stepGetReqId($ks_xmlstrem);
    _writeLog('$reqId='.$reqId);

    /**
     * 3 给坤时返回数据
     */
    //_sendJsonData2ks();



    

    //1 定义类
    class SERVER{
        public function HelloWorld(){
            return "Hello World!" . __FILE__;
        }
    }

    $objSoapServer = new SoapServer("SERVER.wsdl");
    $objSoapServer->setClass("SERVER");//注册类,SERVER
    $objSoapServer->handle();

}catch (Exception $e){
    _writeLog($e->getMessage());
}




