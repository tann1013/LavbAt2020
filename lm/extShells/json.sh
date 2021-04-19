#!/bin/bash
#>>>>>>>>>>每五分钟生成json文件，如pointlist_20210309140554110.json
#日期，使用方式Eg.huadian_bak_${NOW_DATE}
NOW_DATE="`date +%Y%m%d%H%M`"
NEW_FILE="pointlist_${NOW_DATE}.json"
cp /opt/lampp/LumenAdminVueBasicAt2020/exttmp/tpl/pointlist_v419.json /opt/lampp/LumenAdminVueBasicAt2020/exttmp/${NEW_FILE}
echo "已生成文件，${NEW_FILE}！"
