<?php
/**
 * @author tanj@weipaitang.com
 * @date   2019-06-03 08:53
 */

namespace App\Modules\Search\Hotkeys\Consts;

class HotKeysConst
{
    const LIMIT_DEFAULT = 10;   //分页

    /**
     * 关键词状态
     */
    const KEY_STATUS_DEFAULT = 0;//待发布
    const KEY_STATUS_ONLINE  = 1;//已发布（生效中）
    const KEY_STATUS_OFFLINE = 2;//已下线
    const KEY_STATUS_AUTOST = 6;//自动化状态（直播过来的热词，未被编辑）

    /**
     * 热词颜色
     */
    const KEY_IS_RED_NO  = 0;
    const KEY_IS_RED_YES = 1;

    /**
     * 热词类型
     */
    const TYPE_SALE = 1;//拍品
    const TYPE_SHOP = 2;//店铺
    const TYPE_LIVE = 3;//直播

    /**
     * 是否置顶
     */
    const IS_STICK_NO  = 0;//默认不置顶
    const IS_STICK_YES = 1;//置顶

    /**
     * 是否删除
     */
    const IS_DEL_NO  = 0;//未删除
    const IS_DEL_YES = 1; //已删除

    /**
     * 热词来源
     */
    const KEY_SOURCE_USER = 0;//手动添加
    const KEY_SOURCE_AUTO = 1;//自动生成


    //永久过期的固定时间戳
    const TIME_FOR_EVER = "2100-01-01 00:00:00";
    const TIME_FOR_EVER_UNIX = 4102416000;

    const STATE_MAP = [
        self::KEY_STATUS_DEFAULT => '待发布',
        self::KEY_STATUS_ONLINE  => '已发布',
        self::KEY_STATUS_OFFLINE => '已下线',
    ];

    const SOURCE_MAP = [
        self::KEY_SOURCE_USER => '人工',
        self::KEY_SOURCE_AUTO => '自动化',
    ];

}