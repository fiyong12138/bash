```
wget https://raw.githubusercontent.com/fiyong12138/bash/main/frpc-auto/frpc-auto.sh
```
将上面脚本保存，我保存的位置为：/usr/bin/frpwatch

然后在 /etc/rc.local中添加运行命令：
```
nohup /usr/bin/frpwatch > /dev/null 2>&1 &
```
或者crontabe 计划任务定时执行
