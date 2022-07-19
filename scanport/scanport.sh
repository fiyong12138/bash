#!/bin/bash
# -*- coding: utf-8 -*-
ports=(80)
for port in ${ports[@]};
do
    port_status=$(nmap baidu.com -p $port|sed -n "6p"|grep open|wc -l)
    if [ $port_status -lt 1 ]
    then echo "此端口".$port."已断开"|curl -k https://api.day.app/3ec29CNxxxxxxxxxxxxxxx/"此端口$port已断开"
    fi
done
