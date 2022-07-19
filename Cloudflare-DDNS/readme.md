获取CFKEY
打开网页：https://dash.cloudflare.com/profile
在页面下方找到【Global API Key】
设置用于 DDNS 解析的二级域名
在 Cloudflare 中新建一个A记录，如：ddns.yourdomain.com，指向 1.1.1.1

下载仅ipv4脚本
```
wget -N --no-check-certificate https://raw.githubusercontent.com/fiyong12138/bash/main/Cloudflare-DDNS/cf-v4-ddns.sh
```
下载ipv4或ipv6脚本(每个脚本仅可更新一个二级域名，但可同时运行多个脚本)
```
wget -N --no-check-certificate https://raw.githubusercontent.com/fiyong12138/bash/main/Cloudflare-DDNS/cf-v4orv6-ddns.sh
```
授权脚本并执行
chmod +x cf-v4-ddns.sh 
./cf-v4-ddns.sh

如果脚本相关信息填写正确，输出内容会显示当前母鸡IP，登录 Cloudflare DNS选项 查看之前设置的 1.1.1.1 已变为母鸡IP

设置定时任务
输入 crontab -e 然后会弹出 vi 编辑界面，按小写字母 i 进入编辑模式，在文件里面添加一行：
*/2 * * * * /root/cf-v4-ddns.sh >/dev/null 2>&1
如果您需要日志文件，上述代码请替换成下面代码

#如果您需要日志文件，输入下面命令

*/2 * * * * /root/cf-v4-ddns.sh >> /var/log/cf-ddns.log 2>&1
