#!/bin/bash
echo "输入要杀死的服务（例如frp）："
read input1

PID=$(ps -e|grep $input1|awk '{printf $1}')

if [ $? -eq 0 ]; then
    echo "process id:$PID"
else
    echo "process $input1 not exit"
    exit
fi


kill -9 ${PID}

if [ $? -eq 0 ];then
    echo "kill $input1 success"
else
    echo "kill $input1 fail"
fi
<<<<<<< HEAD
 ps -ef | grep python | grep -v grep | awk '{print $2}' | xargs kill -9
=======
>>>>>>> 0be35ad8a74bede1e42e361806107b79dbc06f22
