<?php
//defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package   CodeIgniter RabbitMQ Library
 * @category  Libraries
 * @author    Romain GALLIEN (romaingallien.rg@gmail.com)
 * @license   http://opensource.org/licenses/MIT > MIT License
 * @link      https://github.com/romainrg
 *
 * CodeIgniter Library for RabbitMQ interactions with CodeIgniter using PHP-AMQPLib
 */
namespace App\Libraries\rabbitmq\V2;

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;
use PhpAmqpLib\Wire\AMQPTable;

class Rabbitmq
{


    // Default protected vars
    protected $config;

    // Default public vars
    /* @var AMQPStreamConnection $connexion*/
    public $connexion;
    /* @var \PhpAmqpLib\Channel\AMQPChannel $channel*/
    public $channel;
    public $show_output;

    /**
     * __construct : Constructor
     * @method __construct
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     * @param  array $config Configuration
     */
    public function __construct(array $config = array())
    {
        // Define if we have to show outputs or not
        $this->show_output = (!empty($config['show_output']));

        // Define the config global
        $this->config = (!empty($config)) ? $config : array();

        // Initialize the connection
        $this->initialize($this->config);
    }

    /**
     * initialize : Initialize the configuration of the Library
     * @method initialize
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     * @param  array $config Library configuration
     */
    public function initialize(array $config = array())
    {
        // We check if we have a config given then we initialize the connection
        if (!empty($config)) {
            $this->connexion = new AMQPStreamConnection(
                $this->config['host'],
                $this->config['port'],
                $this->config['user'],
                $this->config['pass'],
                $this->config['vhost'],
                false,
                'AMQPLAIN',
                null,
                'en_US',
                $this->config['connectTimeout'],
                $this->config['readWriteTimeout'],
                null,
                $this->config['keepAlive'],
                $this->config['heartBeat']
            );
            $this->channel = $this->connexion->channel();
        } else {
            $this->outputMessage('Invalid configuration file', 'error', 'x');
        }
    }

    /**
     * push : Push an element in the specified queue
     * @method push
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     * @param  string $queue Specified queue
     * @param  mixed(string/array) $data Datas
     * @param  boolean $permanent Permanent mode of the queue
     * @param  array $params Additional parameters
     * @return bool
     */
    public function push($queue = null, $data = null, $permanent = false, $params = array())
    {
        // We check if the queue is not empty then we declare the queue
        if (!empty($queue)) {

            // We declare the queue
            $this->channel->queue_declare($queue, false, $permanent, false, false, false, null, null);

            // If the informations given are in an array, we convert it in json format
            $data = (is_array($data)) ? json_encode($data) : $data;

            // Create a new instance of message then push it into the selected queue
            $item = new AMQPMessage($data, $params);

            // Publish to the queue
            $this->channel->basic_publish($item, '', $queue);

            // Output
            ($this->show_output) ? $this->outputMessage('Pushing "' . $item->body . '" to "' . $queue . '" queue -> OK', null, '+') : true;
        } else {
            $this->outputMessage('You did not specify the [queue] parameter', 'error', 'x');
        }
    }

    /**
     * @param $data
     * @param string $exchange
     * @param string $routing_key
     * @param array $params
     * @param bool $mandatory
     * @param bool $immediate
     * @param null $ticket
     * @return mixed
     */
    public function pushToExchange($data, $exchange = '', $routing_key = '', $params = [], $mandatory = false, $immediate = false, $ticket = null)
    {
        if (empty($data)) {
            $this->outputMessage('You did not have the message body', 'error', 'x');
            return;
        }
        $data = (!is_string($data)) ? json_encode($data, JSON_UNESCAPED_UNICODE) : $data;
        if (empty($exchange)) {
            $this->outputMessage('You did not specify the [exchange] parameter', 'error', 'x');
            return;
        }
        if (empty($routing_key)) {
            $this->outputMessage('You did not specify the [routing_key] parameter', 'error', 'x');
            return;
        }

        // common
        $_headers = get_value($params, 'headers', []);
        if (!empty($_headers)) {
            unset($params['headers']);
        }

        $item = new AMQPMessage($data, $params);

        // headers
        if (!empty($_headers)) {
            $headers = new AMQPTable($_headers);
            $item->set('application_headers', $headers);
        }

        try {
            $this->channel->basic_publish($item, $exchange, $routing_key, $mandatory, $immediate, $ticket);
        } catch (\Exception $e) {
            wptLog($e->getCode() . '==>' . $e->getMessage() . "date: " . var_export($data, 1) . PHP_EOL, "error/rabbitmq-error-" . date('Y-m-d') . '.log');
            return -1;
        }
    }


    /**
     * @param $data
     * @param string $exchange
     * @param string $routing_key
     * @param array $params
     * @param bool $mandatory
     * @param bool $immediate
     * @param null $ticket
     * @return mixed
     */
    public function pushToBatchExchange($data, $exchange = '', $routing_key = '', $params = [], $mandatory = false, $immediate = false, $ticket = null)
    {

        if (empty($data)) {
            $this->outputMessage('You did not have the message body', 'error', 'x');
            return;
        }
        $data = (!is_string($data)) ? json_encode($data, JSON_UNESCAPED_UNICODE) : $data;
        if (empty($exchange)) {
            $this->outputMessage('You did not specify the [exchange] parameter', 'error', 'x');
            return;
        }
        if (empty($routing_key)) {
            $this->outputMessage('You did not specify the [routing_key] parameter', 'error', 'x');
            return;
        }

        // common
        $_headers = get_value($params, 'headers', []);
        if (!empty($_headers)) {
            unset($params['headers']);
        }

        $item = new AMQPMessage($data, $params);

        // headers
        if (!empty($_headers)) {
            $headers = new AMQPTable($_headers);
            $item->set('application_headers', $headers);
        }

        try {
            $this->channel->batch_basic_publish($item, $exchange, $routing_key, $mandatory, $immediate, $ticket);
            $this->channel->publish_batch();
        } catch (\Exception $e) {
            wptLog($e->getCode() . '==>' . $e->getMessage() . "date: " . var_export($data, 1) . PHP_EOL, "error/rabbitmq-error-" . date('Y-m-d') . '.log');
            return -1;
        }
    }

    /**
     * pull : Get the items from the specified queue (Must be executed with CLI command at this time)
     * @method pull
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     * @param  string $queue Specified queue
     * @param  bool $permanent Permanent mode of the queue
     * @param  array $callback Callback
     */
    public function pull($queue = null, $permanent = false, array $callback = array())
    {
        // We check if the queue is not empty then we declare the queue
        if (!empty($queue)) {

            // Declaring the queue again
            $this->channel->queue_declare($queue, false, $permanent, false, false, false, null, null);

            // Limit the number of unacknowledged
            $this->channel->basic_qos(null, 1, null);

            // Define consuming with 'process' callback
            $this->channel->basic_consume($queue, '', false, false, false, false, $callback);

            // Continue the process of CLI command, waiting for others instructions
            while (count($this->channel->callbacks)) {
                $this->channel->wait();
            }
        } else {
            $this->outputMessage('You did not specify the [queue] parameter', 'error', 'x');
        }
    }

    /**
     * Lock a message
     * @author Stéphane Lucien-Vauthier <s.lucien_vauthier@santiane.fr>
     * @param AMQPMessage $message
     */
    public function lock($message)
    {
        $this->channel->basic_reject($message->delivery_info['delivery_tag'], true);
    }

    /**
     * Release a message
     * @author Stéphane Lucien-Vauthier <s.lucien_vauthier@santiane.fr>
     * @param AMQPMessage $message
     */
    public function unlock($message)
    {
        $this->channel->basic_ack($message->delivery_info['delivery_tag']);
    }

    /**
     * move : Move a message from a queue to another one
     * @method move
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     */
    public function move()
    {
        show_error('This method does not exist', null, 'RabbitMQ Library Error');
    }

    /**
     * purge : Delete everything in the selected queue
     * @method purge
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     * @param  string $queue
     */
    public function purge($queue = null)
    {
        show_error('This method does not exist', null, 'RabbitMQ Library Error');
    }

    /**
     * __destruct : Close the channel and the connection
     * @method __destruct
     * @author Romain GALLIEN <romaingallien.rg@gmail.com>
     */
    public function __destruct()
    {
        // Close the channel
        if (!empty($this->channel)) {
            $this->channel->close();
        }

        // Close the connexion
        if (!empty($this->connexion)) {
            $this->connexion->close();
        }
    }

    /**
     * [output_message : Output defined message in Browser or Console]
     * @param $message
     * @param null $type
     * @param string $symbol
     */
    function outputMessage($message, $type = NULL, $symbol = '>')
    {
        if (IS_CLI) {
            switch ($type) {
                case 'error':
                    echo '[x] RabbitMQ Library Error : ' . $message . PHP_EOL;
                    break;

                default:
                    echo '[' . $symbol . '] ' . $message . PHP_EOL;
                    break;
            }
        } else {
            switch ($type) {
                case 'error':
                    break;

                default:
                    echo $message . '<br>';
                    break;
            }
        }
    }
}
