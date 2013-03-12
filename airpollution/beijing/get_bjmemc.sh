#!/bin/bash

DIR=/var/data/china/airpollution/beijing

cd ${DIR}

types=( PM25 CO Ozone )

if [ $# -ge 1 ]
then
    types=( $1 )
fi

D=`date +%Y%m%d-%H%M`

for T in ${types[@]}
do
    #echo $T
    curl -s "http://zx.bjmemc.com.cn/Charts/${T}.aspx" -o data/${T}_${D}.html
    rm ${T}.html
    ln -s data/${T}_${D}.html ${T}.html
    if [ ${T} == "ApiMap" ]
    then
	grep detailsTable ${T}.html > apimap/${T}_${D}.txt
	rm ${T}.txt
	ln -s apimap/${T}_${D}.txt ${T}.txt
    fi
done
