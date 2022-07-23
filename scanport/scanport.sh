#!/bin/bash
# -*- coding: utf-8 -*-
time=$(date "+%Y-%m-%d %H:%M:%S")
for port in 80 8080
do
    port_status=$(nmap baidu.com -p $port|sed -n "6p"|grep open|wc -l)
    if [ $port_status -lt 1 ]
    then echo "此端口".$port."已断开"|curl -k https://api.day.app/3ec29CNxxxxxxxxxxxxxxx/"此端口$port已断开"
    else echo $time$port"全部正常"
    fi
done
