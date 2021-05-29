#!/bin/bash
#功能说明：每五分钟生成json文件，如pointlist_20210309140554110.json
#crontab设置： */30 * * * * sh /opt/lampp/LumenAdminVueBasicAt2020/lm/extShells/json.sh >> /dev/null 2>&1
#1 设置路径配置
#线上
#BASE_PATH=/opt/lampp/LumenAdminVueBasicAt2020
#本地
BASE_PATH=/Users/tanjian/web/woniuStudioProjects/LavbAt2020

#2 日期，使用方式Eg.huadian_bak_${NOW_DATE}
NOW_DATE="`date +%Y%m%d%H%M`"
NEW_FILE="pointlist_${NOW_DATE}.json"
#3 执行逻辑
cp ${BASE_PATH}/exttmp/tpl/pointlist_v419.json ${BASE_PATH}/exttmp/${NEW_FILE}
echo "已生成文件，${NEW_FILE}！"
