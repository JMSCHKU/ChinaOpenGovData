#!/bin/bash

DIR=/var/data/china/airpollution/beijing

cd ${DIR}

D=`date +%Y%m%d-%H00`

curl "http://zx.bjmemc.com.cn/ashx/Data.ashx?Action=GetAQIClose1h" -o "AQI/AQIClose1h_${D}.json"
