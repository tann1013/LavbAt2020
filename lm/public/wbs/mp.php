<?php
/**
 * 模拟南自服务端
 */

const KUNSHI_REC_URL = 'http://hd2.com/wbs/SERVER.php?wsdl';

function _writeLog($content){
//    $path =  __DIR__ . '/wbs-'.date('Y-m-d').'.log';
    $path = __DIR__ . '/wbs.log';
    file_put_contents($path, ''.date('Y-m-d H:i:s', time()).' '.$content.PHP_EOL, FILE_APPEND);
}
function _sendJsonData2ks(){

    /**
     * 1 配置
     */
    $withXml = <<<EOT
<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <soapenv:Body>
        <ns1:dataReq soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
            xmlns:ns1="http://tempuri.org/">
            <ns1:arg0 xsi:type="soapenc:string"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
			    <?xml version="1.0" encoding="UTF-8"?>
                    <replyDataMsg>
                        <replyId>2021060300000082</replyId>
                        <facName>hd</facName>
                        <replyFlag>1</replyFlag>
                        <replyData>[{"datasource":"上海创智园光伏站","name":"光伏区-cpu-日发电量","num":"1","value":"3628.42"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-累计发电量","num":"2","value":"7.15178e+06"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-总SO2减排","num":"3","value":"214553"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-总NOx减排","num":"4","value":"107277"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-总减排标煤量","num":"5","value":"2.86071e+06"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-输出总有功功率","num":"6","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-逆变器效率","num":"7","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器1通讯故障","num":"8","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器2通讯故障","num":"9","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器3通讯故障","num":"10","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器4通讯故障","num":"11","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器5通讯故障","num":"12","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器6通讯故障","num":"13","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-1号楼逆变器7通讯故障","num":"14","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器1通讯故障","num":"15","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器2通讯故障","num":"16","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器3通讯故障","num":"17","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器4通讯故障","num":"18","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器5通讯故障","num":"19","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器6通讯故障","num":"20","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-2号楼逆变器7通讯故障","num":"21","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器1通讯故障","num":"22","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器2通讯故障","num":"23","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器3通讯故障","num":"24","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器4通讯故障","num":"25","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器5通讯故障","num":"26","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器6通讯故障","num":"27","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-3号楼逆变器7通讯故障","num":"28","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器1通讯故障","num":"29","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器2通讯故障","num":"30","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器3通讯故障","num":"31","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器4通讯故障","num":"32","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器5通讯故障","num":"33","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器6通讯故障","num":"34","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-4号楼逆变器7通讯故障","num":"35","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-5号楼逆变器1通讯故障","num":"36","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-5号楼逆变器2通讯故障","num":"37","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-5号楼逆变器3通讯故障","num":"38","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-5号楼逆变器4通讯故障","num":"39","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-5号楼逆变器5通讯故障","num":"40","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-6号楼逆变器1通讯故障","num":"41","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-6号楼逆变器2通讯故障","num":"42","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-6号楼逆变器3通讯故障","num":"43","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-6号楼逆变器4通讯故障","num":"44","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-6号楼逆变器5通讯故障","num":"45","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-7号楼逆变器1通讯故障","num":"46","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-7号楼逆变器2通讯故障","num":"47","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-7号楼逆变器3通讯故障","num":"48","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-7号楼逆变器4通讯故障","num":"49","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-8号楼逆变器1通讯故障","num":"50","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-8号楼逆变器2通讯故障","num":"51","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-8号楼逆变器3通讯故障","num":"52","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-8号楼逆变器4通讯故障","num":"53","value":"0"},{"datasource":"上海创智园光伏站","name":"光伏区-cpu-水泵房逆变器通讯故障","num":"54","value":"0"},{"datasource":"集科OPC","name":"发电机有功功率_6XNRJIW540","num":"55","value":"0"},{"datasource":"集科OPC","name":"总功率_SCREEN01AI01","num":"56","value":"3943"},{"datasource":"集科OPC","name":"供能效率_GNXL101","num":"57","value":"0"},{"datasource":"集科OPC","name":"#1内燃机累计发电量_10RJ0101AW","num":"58","value":"1.3651e+07"},{"datasource":"集科OPC","name":"#2内燃机累计发电量_10RJ0102AW","num":"59","value":"1.26226e+07"},{"datasource":"集科OPC","name":"#3内燃机累计发电量_10RJ0103AW","num":"60","value":"9.14754e+06"},{"datasource":"集科OPC","name":"#2内燃机输出有功电量_U2NRJPW","num":"61","value":"9.94161e+07"},{"datasource":"集科OPC","name":"#3内燃机输出有功电量_U3NRJPW","num":"62","value":"1.13773e+08"},{"datasource":"集科OPC","name":"#1内燃机输出有功电量_U1NRJPW","num":"63","value":"7.54486e+07"},{"datasource":"集科OPC","name":"分水器水温度_TE111","num":"64","value":"35.9442"},{"datasource":"集科OPC","name":"集水器水温度_TE112","num":"65","value":"36.1869"},{"datasource":"集科OPC","name":"分水器压力_PT111","num":"66","value":"0.488431"},{"datasource":"集科OPC","name":"集水器压力_PT112","num":"67","value":"0.344568"}]</replyData>
                    </replyDataMsg>
            </ns1:arg0>
        </ns1:dataReq>
    </soapenv:Body>
</soapenv:Envelope>
EOT;
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


try{
    _writeLog('start...');

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

