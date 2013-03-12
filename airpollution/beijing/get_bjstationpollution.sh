#!/bin/bash

DIR=/var/data/china/airpollution/beijing

cd ${DIR}

D=`date +%Y%m%d-%H%M`

districts="districts.txt"
if [ $# -ge 1 ]
then
    districts=$1
fi

while read T
do
    #echo $T
    curl -s "http://zx.bjmemc.com.cn/ashx/Data.ashx?Action=GetIAQIAll_ByStation&StationName=${T}" -o data/${T}_${D}.html
    rm latest/${T}.html
    cd latest
    ln -s ../data/${T}_${D}.html ${T}.html
    cd - > /dev/null
done < $districts
