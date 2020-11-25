<?php
/**
 * 用作单例
 *
 * Trait Singleton
 * @package App\Utils
 */
namespace App\Utils;

trait Singleton
{
    private static $instance;

    static function getInstance(...$args)
    {
        if (!isset(self::$instance)) {
            self::$instance = new static(...$args);
        }
        return self::$instance;
    }
}