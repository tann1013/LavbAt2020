<?php

namespace App\Models;

/**
 * Class Admin Model
 *
 * @property integer $id 管理ID
 * @property string $username 管理员登录账号/登录名
 * @property string $password 登录密码
 * @property integer $status 账号状态[0:已禁用;10:正常;]
 * @property string $avatar 管理员头像
 * @property string $email 管理员邮箱
 * @property string $nickname 昵称
 * @property string $last_login_time 最后一次登录时间
 * @property string $last_login_ip 最后一次登录IP
 * @property integer $is_delete 是否删除
 * @property integer $created_at 创建时间
 * @property integer $updated_at 更新时间
 *
 * @package App\Models
 */
class BillModel extends BaseModel
{

    /**
     * @var string 定义表名字
     */
    protected $table = 'bage_bill';



}
