echo 'FPM Starting ...'
sudo php-fpm >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FPM 第1次 FAIL";
    sudo kill `cat /var/run/php-fpm.pid`
    #sleep 3
    echo 'kill FPM'
    sudo php-fpm  >/dev/null 2>&1

    if [ $? -ne 0 ]; then
          echo "FPM 第2次 FAIL";
    else
         echo "FPM 第2次 SUCC"
    fi

else
    echo "FPM 第1次 SUCC";
    sudo nginx >/dev/null 2>&1 & sudo redis-server >/dev/null 2>&1 & mysqld >/dev/null 2>&1 & echo 'Init#successfull' & exit;
fi

echo 'FPM End' & sudo nginx >/dev/null 2>&1 & sudo redis-server >/dev/null 2>&1 & sudo mongod --dbpath ~/homeData/ >/dev/null 2>&1 & echo 'init succesfull';

#sudo php-fpm  >/dev/null 2>&1 || echo 'err1' & sudo kill -INT `cat /var/run/php-fpm.pid` || echo 'err2'
#kill -INT `cat /var/run/php-fpm.pid`;sudo php-fpm;
#sudo nginx;sudo redis-server;