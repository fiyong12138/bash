#!/bin/bash
echo "Input process name first"
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
————————————————
版权声明：本文为CSDN博主「sunshine008」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/sun172270102/article/details/72801350