#! /bin/bash
#controller、model、testcase
#使用说明：在项目根目录下执行如下脚本
#sh this.sh User 会生成对应的三个文件
#app/Http/Controllers/admin/UserController.php
#app/Models/User.php
#/test/admin/UserTest.php

if [ ! -n "$1" ] ;then
echo "请输出模块名称！如：User"
else
php artisan make:controller /api/$1Controller &&\
php artisan make:model /Models/$1Model &&\
php artisan make:logic /Logics/Api/$1Logic &&\
#php artisan make:test /admin/$1Test --unit

echo "done。"
fi