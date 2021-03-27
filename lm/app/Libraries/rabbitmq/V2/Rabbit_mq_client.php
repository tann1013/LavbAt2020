<?php
namespace App\Libraries\rabbitmq\V2;

class Rabbit_mq_client
{
    private $config = [];

    private $typeToMQConfig = [
        "adminMessage" => [
            "exchangeName" => "adminMessage",
            "routingKey" => "adminMessage"
        ],

        "bidMessage2App" => [
            "exchangeName" => "bidMessage2App",
            "routingKey" => "bidMessage2App"
        ],
        "saleEndMessage2App" => [
            "exchangeName" => "persis.saleEndMessage2App",
            "routingKey" => "persis.saleEndMessage2App"
        ],
        "message2App" => [
            "exchangeName" => "message2App",
            "routingKey" => "message2App"
        ],
        "autoRefundMessage2App" => [
            "exchangeName" => "autoRefundMessage2App",
            "routingKey" => "autoRefundMessage2App"
        ],
        "deliveryMessage2App" => [
            "exchangeName" => "deliveryMessage2App",
            "routingKey" => "deliveryMessage2App"
        ],
        "refundMessage2App" => [
            "exchangeName" => "refundMessage2App",
            "routingKey" => "refundMessage2App"
        ],
        "refundApplyMessage2App" => [
            "exchangeName" => "refundApplyMessage2App",
            "routingKey" => "refundApplyMessage2App"
        ],
        "refundForDealMessage2App" => [
            "exchangeName" => "refundForDealMessage2App",
            "routingKey" => "refundForDealMessage2App"
        ],
        "returnDeliveryMessage2App" => [
            "exchangeName" => "returnDeliveryMessage2App",
            "routingKey" => "returnDeliveryMessage2App"
        ],
        "deliveryTimeoutMessage2App" => [
            "exchangeName" => "deliveryTimeoutMessage2App",
            "routingKey" => "deliveryTimeoutMessage2App"
        ],
        "payTimeoutMessage2App" => [
            "exchangeName" => "payTimeoutMessage2App",
            "routingKey" => "payTimeoutMessage2App"
        ],
        "settleRatioUpdateMessage2App" => [
            "exchangeName" => "settleRatioUpdateMessage2App",
            "routingKey" => "settleRatioUpdateMessage2App"
        ],
        "unrefundMessage2App" => [
            "exchangeName" => "unrefundMessage2App",
            "routingKey" => "unrefundMessage2App"
        ],
        "smallMessage2App" => [
            "exchangeName" => "smallMessage2App",
            "routingKey" => "smallMessage2App"
        ],
        "finicalMessage2App" => [
            "exchangeName" => "finicalMessage2App",
            "routingKey" => "finicalMessage2App"
        ],
        "saleEndToSellerMessage2App" => [
            "exchangeName" => "saleEndToSellerMessage2App",
            "routingKey" => "saleEndToSellerMessage2App"
        ],
        "saleEndToLikerMessage2App" => [
            "exchangeName" => "saleEndToLikerMessage2App",
            "routingKey" => "saleEndToLikerMessage2App"
        ],
        "saleEndToBidderMessage2App" => [
            "exchangeName" => "saleEndToBidderMessage2App",
            "routingKey" => "saleEndToBidderMessage2App"
        ],
        "saleReportMessage2App" => [
            "exchangeName" => "saleReportMessage2App",
            "routingKey" => "saleReportMessage2App"
        ],
        "adminMessage2App" => [
            "exchangeName" => "adminMessage2App",
            "routingKey" => "adminMessage2App"
        ],

        // Wechat Queue
        "textMessage2Wechat" => [
            "exchangeName" => "textMessage2Wechat",
            "routingKey" => "textMessage2Wechat"
        ],
        "saleTimeoutDemoMessage2Wechat" => [
            "exchangeName" => "saleTimeoutDemoMessage2Wechat",
            "routingKey" => "saleTimeoutDemoMessage2Wechat"
        ],
        "graphicMessage2Wechat" => [
            "exchangeName" => "graphicMessage2Wechat",
            "routingKey" => "graphicMessage2Wechat"
        ],
        "bidMessage2Wechat" => [
            "exchangeName" => "bidMessage2Wechat",
            "routingKey" => "bidMessage2Wechat"
        ],
        "financialMessage2Wechat" => [
            "exchangeName" => "financialMessage2Wechat",
            "routingKey" => "financialMessage2Wechat"
        ],
        "deliveryMessage2Wechat" => [
            "exchangeName" => "deliveryMessage2Wechat",
            "routingKey" => "deliveryMessage2Wechat"
        ],
        "smallMessage2Wechat" => [
            "exchangeName" => "smallMessage2Wechat",
            "routingKey" => "smallMessage2Wechat"
        ],
        "saleEndToSellerMessage2Wechat" => [
            "exchangeName" => "saleEndToSellerMessage2Wechat",
            "routingKey" => "saleEndToSellerMessage2Wechat"
        ],
        "saleEndToLikerMessage2Wechat" => [
            "exchangeName" => "saleEndToLikerMessage2Wechat",
            "routingKey" => "saleEndToLikerMessage2Wechat"
        ],
        "saleEndToBidderMessage2Wechat" => [
            "exchangeName" => "saleEndToBidderMessage2Wechat",
            "routingKey" => "saleEndToBidderMessage2Wechat"
        ],
        "saleEndMessage2Wechat" => [
            "exchangeName" => "saleEndMessage2Wechat",
            "routingKey" => "saleEndMessage2Wechat"
        ],
        "saleReportMessage2Wechat" => [
            "exchangeName" => "saleReportMessage2Wechat",
            "routingKey" => "saleReportMessage2Wechat"
        ],

        // SMS queue
        "templateSMSMessage2Phone" => [
            "exchangeName" => "templateSMSMessage2Phone",
            "routingKey" => "templateSMSMessage2Phone"
        ],

        // WPT Trigger
        "saleEnd" => [
            "exchangeName" => "saleEnd",
            "routingKey" => "saleEnd"
        ],

        "wxAppFormId" => [
            "exchangeName" => "wxAppFormId",
            "routingKey" => "wxAppFormId"
        ],
        "message2WechatApp" => [
            "exchangeName" => "message2WechatApp",
            "routingKey" => "message2WechatApp"
        ],
        "saleImg" => [
            "exchangeName" => "image_sale_exchange",
            "routingKey" => "image_sale_routingkey"
        ],
        "gbImg" => [
            "exchangeName" => "image_gb_exchange",
            "routingKey" => "image_gb_routingkey"
        ],
        "verifyImg" => [
            "exchangeName" => "image_verify_exchange",
            "routingKey" => "image_verify_routingkey"
        ],
        "headerImg" => [
            "exchangeName" => "image_avatar_exchange",
            "routingKey" => "image_avatar_routingkey"
        ],
        "certImg" => [
            "exchangeName" => "image_cert_exchange",
            "routingKey" => "image_cert_routingkey"
        ],
    ];

    private $rabbitMQConnectList = null;

    /**
     * Rabbit_mq_client constructor.
     * @param string $config
     */
    function __construct($config = 'rabbitMq')
    {
        app()->configure($config);
        $this->config = config($config);
    }

    // 私信通知App用户
    /**
     * @param $messageBody []
     * $messageData = [
            "message" => $message,
            "tousers" => $tousers,
            "url" => $url,
            "fromuser" => ["uri", "custom services", etc.]
        ];
     * @param $messageBody
     * @return array|bool
     */

    public function message2App($messageBody) {
        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $message = $this->get_value($messageBody, 'message', '');
        if(empty($message)) {
            return $this->ajaxResult(101, 'Message is empty!');
        }

        $tousers = $this->get_value($messageBody, 'tousers', []);
        if(empty($tousers) && !is_array($tousers)) {
            return $this->ajaxResult(101, 'To users is empty!');
        }

        $exchangeName = 'message2App';
        $routingKey = 'message2App';

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    public function getMQConfig($type = '') {
        return $this->get_value($this->typeToMQConfig, $type, '');
    }

    /**
     * @param $messageBody []
     *
        $messageData = [
            "message" => $message,
            "tousers" => $tousers,
            "url" => $url,
            "fromuser" => ["uri", "custom services", etc.],
            "exchangeName" => "",
            "routingKey" => ""
        ];
     * @param $type
     * @param $messageBody
     * @return array|bool
     */
    public function pushMessage2App($type, $messageBody) {

        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $message = $this->get_value($messageBody, 'message', '');
        if(empty($message)) {
            return $this->ajaxResult(101, 'Message is empty!');
        }

        $tousers = $this->get_value($messageBody, 'tousers', []);
        if(empty($tousers) && !is_array($tousers)) {
            return $this->ajaxResult(101, 'To users is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    public function MQPush($type, $messageBody, $params = []) {
        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }
        if(empty($messageBody)) {
            return $this->ajaxResult(101, 'MessageBody is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey, $params);
    }

    public function MQDelayPush($type, $messageBody, $xDelay = 1) {
        $params = [
            "headers" => [
                "x-delay" => $xDelay * 1000
            ],
            "delivery_mode" => 2
        ];
        return $this->MQPush($type, $messageBody, $params);
    }

    /**
     * 发送文字消息给WeChat
     * @param $messageBody
     * @return array
     */
    public function message2AppAsync($messageBody) {
        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $message = $this->get_value($messageBody, 'message', '');
        if(empty($message)) {
            return $this->ajaxResult(101, 'Message is empty!');
        }

        $tousers = $this->get_value($messageBody, 'tousers', []);
        if(empty($tousers) && !is_array($tousers)) {
            return $this->ajaxResult(101, 'To users is empty!');
        }

        $exchangeName = 'message2App';
        $routingKey = 'message2App';

        $this->RabbitMQExchangePublishAsync($messageBody, $exchangeName, $routingKey);
    }

    /**
     * 发送文字消息给WeChat
     * @param $type
     * @param $messageBody
     * @return array|bool
     */
    public function pushTextMessage2Wechat($type, $messageBody) {
        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $msgtype = $this->get_value($messageBody, 'msgtype', '');
        if(empty($msgtype) || $msgtype != 'text') {
            return $this->ajaxResult(101, 'Message is type empty or not text!');
        }

        $touser = $this->get_value($messageBody, 'touser', []);
        if(empty($touser)) {
            return $this->ajaxResult(101, 'To user is empty!');
        }

        $text = $this->get_value($messageBody, 'text', []);
        if(empty($text)) {
            return $this->ajaxResult(101, 'Text is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    /**
     * 发送图文消息给WeChat 单条／多条
     * @param $type
     * @param $messageBody
     * @return array|bool
     */
    public function pushGraphicMessage2Wechat($type, $messageBody) {
        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        if(!isset($messageBody['isMulti'])) {
            return $this->ajaxResult(101, 'Simple or multi does not indicate!');
        }

        $touser = $this->get_value($messageBody, 'touser', []);
        if(empty($touser)) {
            return $this->ajaxResult(101, 'To user is empty!');
        }

        $isMulti = $this->get_value($messageBody, 'isMulti', 0);
        if($isMulti) {
            // data
            $data = $this->get_value($messageBody, 'data', []);
            if(empty($data)) {
                return $this->ajaxResult(101, 'Multi news data is empty!');
            }
        } else {
            $url = $this->get_value($messageBody, 'url', []);
            if(empty($url)) {
                return $this->ajaxResult(101, 'Url is empty!');
            }

            $picurl = $this->get_value($messageBody, 'picurl', []);
            if(empty($picurl)) {
                return $this->ajaxResult(101, 'Pic url is empty!');
            }

            $title = $this->get_value($messageBody, 'title', []);
            if(empty($title)) {
                return $this->ajaxResult(101, 'Title is empty!');
            }
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    /**
     * 发送模版消息
     * @param $type
     * @param $messageBody
     * @return array|bool
     */
    public function pushTemplateMessage2Wechat($type, $messageBody) {
        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $touser = $this->get_value($messageBody, 'touser', []);
        if(empty($touser)) {
            return $this->ajaxResult(101, 'To user is empty!');
        }

        $content = $this->get_value($messageBody, 'content', []);
        if(empty($content)) {
            return $this->ajaxResult(101, 'Content is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    /**
     * 发送无返回短信
     * @param $type
     * @param $messageBody
     * @return array|bool
     */
    public function pushTemplateSMSMessage2Phone($type, $messageBody) {
        if(empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if(is_string($messageBody)) {
            $messageBody = json_decode($messageBody, 1);
        }

        $touser = $this->get_value($messageBody, 'touser', []);
        if(empty($touser)) {
            return $this->ajaxResult(101, 'To user is empty!');
        }

        $content = $this->get_value($messageBody, 'content', []);
        if(empty($content)) {
            return $this->ajaxResult(101, 'Content is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    /**
     * 发送图片消息队列
     * @param $type
     * @param string|array $messageBody
     * @return array|bool
     */
    public function pushImgMessage($type, $messageBody)
    {
        if (empty($type)) {
            return $this->ajaxResult(101, 'Type is empty!');
        }

        if (empty($messageBody)) {
            return $this->ajaxResult(101, 'Content is empty!');
        }

        $_MQConfig = $this->getMQConfig($type);
        $exchangeName = $this->get_value($_MQConfig, 'exchangeName', '');
        $routingKey = $this->get_value($_MQConfig, 'routingKey', '');

        return $this->RabbitMQExchangeClientPush($messageBody, $exchangeName, $routingKey);
    }

    /**
     *
     * @return mixed|null
     */
    private function get_value()
    {
        $args = func_get_args();
        $value = null;
        switch (count($args)) {
            case 2:
                //单一变量
                list($_data, $_default_value) = $args;
                $value = $_default_value;
                if (!is_null($_data)) {
                    $value = $_data;
                }
                break;
            case 3:
                //数组或对象
                list($_data, $_key, $_default_value) = $args;
                $value = $_default_value;
                if (is_array($_data)) {
                    if (isset($_data[$_key])) {
                        $value = $_data[$_key];
                    }
                } elseif (is_object($_data)) {
                    if (property_exists($_data, $_key)) {
                        $value = $_data->$_key;
                    };
                }
                break;
            case 4:
                //数组或对象+回调函数
                list($_data, $_key, $_default_value, $_closure) = $args;
                $value = $_default_value;
                if (is_array($_data)) {
                    if (isset($_data[$_key])) {
                        $value = $_data[$_key];
                    }
                } elseif (is_object($_data)) {
                    if (property_exists($_data, $_key) || isset($_data->$_key)) {
                        $value = $_data->$_key;
                    };
                }
                if ('Closure' == get_class($_closure)) {
                    $value = $_closure($value);
                }
                break;
        }

        return $value;
    }

    /**
     * @param $publishData
     * @param $exchange
     * @param $routingKey
     * @param $params
     * @return array|bool
     */
    // connection will be create at first
    // loop the data if the data is multi array ===> multi revoke this function
    private function RabbitMQExchangeClientPush($publishData, $exchange, $routingKey, $params = []) {
        // routing key ~ queue name
        if(empty($exchange)) {
            return $this->ajaxResult(102, 'Exchange is empty!');
        }
        if(empty($routingKey)) {
            return $this->ajaxResult(102, 'Routing key is empty!');
        }
        if(empty($publishData)) {
            return $this->ajaxResult(102, 'Data is empty!');
        }
        $host = $this->getHost();
        if(empty($this->rabbitMQConnectList[$host])) {
            try {
                $this->rabbitMQConnectList[$host] = new Rabbitmq([
                    "host" => $host,
                    "port" => $this->config["port"],
                    "user" => $this->config["user"],
                    "pass" => $this->config["pass"],
                    "vhost" => $this->config["vhost"],
                    false,
                    'AMQPLAIN',
                    null,
                    'en_US',
                    "connectTimeout" => $this->config['connectTimeout'],
                    "readWriteTimeout" => $this->config['readWriteTimeout'],
                    null,
                    "keepAlive" => $this->config['keepAlive'],
                    "heartBeat" => $this->config['heartBeat']
                ]);
            } catch (\Exception $e) {
                // count not create the connection
                wptLog($e->getCode() . '==>' . $e->getMessage() . "host:" . $host . PHP_EOL, "error/rabbitmq-error-" . date('Y-m-d') . '.log');
                return $this->ajaxResult(103, $e->getMessage());
            }
        }

        // push the message
        $ret = $this->rabbitMQConnectList[$host]->pushToExchange($publishData, $exchange, $routingKey, $params);
        return $ret == -1 ? $this->ajaxResult(105, 'Exception Msg') : $this->ajaxResult();
    }

    /**
     *
     * @param $publishData
     * @param $exchange
     * @param $routingKey
     * @param array $properties
     * @return array
     */
    private function RabbitMQExchangePublishAsync($publishData, $exchange, $routingKey, $properties = []) {
        // routing key ~ queue name
        if(empty($exchange)) {
            return $this->ajaxResult(102, 'Exchange is empty!');
        }
        if(empty($routingKey)) {
            return $this->ajaxResult(102, 'Routing key is empty!');
        }
        if(empty($publishData)) {
            return $this->ajaxResult(102, 'Data is empty!');
        }

        $rabbitMQHost = $this->getWriteHost();
        $auth = [
            "user" => $this->config['user'],
            "pass" => $this->config['pass']
        ];
        $vhhost = urlencode($this->config['vhost']);
        $dataFormat = [
            "properties" => $properties,
            "routing_key" => $routingKey,
            "payload" => is_string($publishData) ? $publishData : json_encode($publishData, JSON_UNESCAPED_UNICODE),
            "payload_encoding" => "string"
        ];

        $cli = new swoole_http_client($this->getHost(), $this->config['apiPort']);
        $cli->setHeaders([
            "Authorization" => "Basic " . base64_encode(join(':', array_values($auth))),
            "Accept-Encoding" => "application/json"
        ]);

        $cli->post($rabbitMQHost . '/api/exchanges/' . $vhhost . '/' . $exchange . '/publish',
            json_encode($dataFormat, JSON_UNESCAPED_UNICODE),
            function ($cli) {
                // todo
                $cli->close();
            }
        );
    }

    /**
     * @param $string
     * @return int
     */
    private function crc16($string)
    {
        $crc = 0xFFFF;
        for ($i = 0, $len = strlen($string); $i < $len; $i++) {
            $crc ^= ord($string[$i]);
            for ($j = 8; $j != 0; $j--) {
                if (($crc & 0x0001) != 0) {
                    $crc >>= 1;
                    $crc ^= 0xA001;
                } else
                    $crc >>= 1;
            }
        }
        return $crc;
    }

    /**
     *  Get message write host index
     * @return string
     */
    private function getWriteHost()
    {
        return 'http://' . $this->getHost() . ':' . $this->config['apiPort'];
    }

    /**
     * @return mixed
     */
    private function getHost()
    {
        $hosts = $this->config['hosts'];
        return $hosts[$this->crc16(mt_rand(1, 100)) % count($hosts)];
    }


    /**
     * @return array
     */
    private function ajaxResult()
    {
        $result = [
            'status' => [
                'code' => '0',
                'msg' => ''
            ]
        ];
        $args = func_get_args();
        foreach ($args as $arg) {
            if (is_int($arg)) {
                $result['status']['code'] = strval($arg);
            } elseif (is_string($arg)) {
                $result['status']['msg'] = strval($arg);
            } elseif (is_array($arg)) {
                $result = $result + $arg;
            }
        }
        return $result;
    }

    /**
     *
     * @param string $key
     * @return bool
     */
    public function setAccessToken2MQRedis($key = '') {
        if(empty($key)) {
            return false;
        }
        $prefixMQRedisKey = config_item('prefix_redis_rabbit_mq_key');
        $key = $prefixMQRedisKey . $key;
        $mqRedisConfigList = config_item('redis_rabbit_mq');
        $mqRedisConfig = $mqRedisConfigList[$this->crc16($key) % count($mqRedisConfigList)];
        $host = $mqRedisConfig['host'];
        $port = $mqRedisConfig['port'];
        $auth = $mqRedisConfig['auth'];

        $redis = new \Redis();
        $redis->connect($host, $port);
        $redis->auth($auth);
        $redis->set($key, access_token(), 4200);
    }
}