#!/bin/bash

for i in `seq $1 $2`
    do echo $i
    sleep 0.5
    #curl -s "http://press.gapp.gov.cn:8088/newsagency_search/station_detail.jsp?new_id=${i}" -o foobar.station
    curl -s "http://press.gapp.gov.cn:8088/press_search/pages/query/queryAction!findreportstation.action?reportId=${i}&test=1" -o foobar.station
    SIZE=`wc -c foobar.station | cut -d" " -f1`
    if [ $SIZE -gt 5252 ]
    then
	mv foobar.station station/${i}.html
    else
	rm foobar.station
    fi
done
