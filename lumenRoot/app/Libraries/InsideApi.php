<?php
/**
 * Class InsideMessage
 * 内网接口路类
 *
 */
namespace App\Libraries;


use App\Utils\Singleton;

class InsideApi
{
    use Singleton;

    const IM_TOKEN = "bef2a023c4f1f17230084761695da9f9";
    const URI_IM_SYS_NOTICE_MSG = "/inside/v1.0/im/sys-notice-msg";//发送黄色私信消息

    /**
     * xxx消息
     * @param $userinfoId
     * @param $message
     * @return array
     */
    public function imSysNoticeMsg($userinfoId, $message)
    {
        //$postUrl = $this->getBaseUrlWithImToken(self::URI_IM_SYS_NOTICE_MSG);
        $postUrl = '';

        $params = [
            "userinfoId" => $userinfoId,
            "message"    => $message
        ];
        $result = curl_http_post($postUrl, $params);

        //记录日志
        //Logger::info("内网-发送私信消息:params:" . json_encode($params, JSON_UNESCAPED_UNICODE) . ";result:" . json_encode($result, JSON_UNESCAPED_UNICODE));

        return $result;
    }

}