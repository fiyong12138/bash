#!/bin/bash
# -*- coding: utf-8 -*-
time=$(date "+%Y-%m-%d %H:%M:%S")
for port in 80 8080   #改为要监控的端口号
do
    port_status=$(nmap baidu.com -p $port|sed -n "6p"|grep open|wc -l)
    if [ $port_status -lt 1 ]
    then echo "此端口".$port."已断开"|post1=$(curl -ks https://api.day.app/3ec29CNxxxxxxxxxxxxxxx/"此端口$port已断开")
		code1=`echo $post1|grep -Po 'code[":]+\K[^,]+'`
		if [ $code1 -ne 200 ]
		then echo "服务器地址错误"
			if [0] #若启用备用服务器将0改成1
			then echo "启用备用服务器"
     		post2=$(curl -ks https://api.day.app/3ec29CNxxxxxxxxx/"此端口$port已断开")
     		code2=`echo $post2 | grep -Po 'code[":]+\K[^,]+'`
        		if [ $code2 -ne 200 ]
       		 	then echo "备用服务器失效" & echo " " > 备用服务器失效
        		else echo "备用服务器正常"
        		fi
			fi
		fi
    else echo $time" 端口"$port" 全部正常"
    fi
done
