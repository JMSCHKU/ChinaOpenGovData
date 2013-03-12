#!/bin/bash

for i in `seq $1 $2`
    do echo $i
    sleep 0.5
    #curl -s "http://press.gapp.gov.cn:8088/newsagency_search/reporter.jsp?new_id=${i}&new_name=" -o foobar.reporter
    curl -s "http://press.gapp.gov.cn:8088/press_search/pages/query/queryAction!findReporterList.action?orgId=${i}&test=1" -o foobar.reporter
    SIZE=`wc -c foobar.reporter | cut -d" " -f1`
    echo ${SIZE}
    if [ $SIZE -ne 5785 ]
    then
	mv foobar.reporter reporter/${i}.html
    else
	rm foobar.reporter
    fi
done
