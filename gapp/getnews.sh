#!/bin/bash

for i in `seq $1 $2`
    do echo $i
    sleep 0.5
    #curl -s "http://press.gapp.gov.cn:8088/newsagency_search/newsagency_detail.jsp?new_id=${i}" -o foobar.news
    curl -s "http://press.gapp.gov.cn:8088/press_search/pages/query/queryAction!findMediaDetail.action?id=${i}&test=1" -o foobar.news
    SIZE=`wc -c foobar.news | cut -d" " -f1`
    if [ ${SIZE} -ne 7396 ]
    then
	mv foobar.news news/${i}.html
    else
	rm foobar.news
    fi
done
