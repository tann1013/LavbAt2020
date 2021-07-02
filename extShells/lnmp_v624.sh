#! /bin/bash
echo 'Lnmp Starting ...'
#方法必要服务（启动php、NGINX服务）
function StartFw()
{
    printf "Starting fw...";
}
#step1 判断是否已经启用php-fpm
DAEMON_NUM=`ps -eaf | grep "php-fpm" | grep -v "grep" | wc -l`
echo $DAEMON_NUM
if [ "$DAEMON_NUM" -eq 0 ];then
    #没有php-fpm进程
    #sudo sudo php-fpm >/dev/null 2>&1
    echo '没有php-fpm进程.';
else
   #有php-fpm进程，则关闭掉
   pids=`ps -ef|grep php-fpm|grep -v grep|awk '{print $2}'`
   for pid in ${pids}
   do
       echo "kill php-fpm pid" $pid
       sudo kill -KILL $pid >/dev/null 2>&1;
   done
fi
#step2 启动必要的服务
StartFw

sudo php-fpm >/dev/null 2>&1 & echo '已启动，PHP-fpm';
mysql.server start >/dev/null 2>&1 & echo '已启动，mysql';
sudo nginx >/dev/null 2>&1 & echo '已启动，nginx';
sudo mongod --dbpath ~/homeData/ >/dev/null 2>&1 & echo '已启动，mongo';
echo 'Lnmp Successfull!' & exit;