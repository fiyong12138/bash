#!/bin/bash
# -*- coding: utf-8 -*-
ports=(5999,6000,6001,6005)
for port in ${ports[@]};
do
    port_status=$(nmap hk.571314.xyz -p $port|sed -n "6p"|grep open|wc -l)
    if [ $port_status -lt 1 ]
    then echo "hk-frp此端口".$port."已断开"|curl -k https://api.day.app/3ec29CNxxxxxxxxxxxxxxx/"hk-frp此端口$port已断开"
    fi
done