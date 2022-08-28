#!/usr/bin/env bash
RED_COLOR="\033[0;31m"
NO_COLOR="\033[0m"
GREEN="\033[32m\033[01m"
BLUE="\033[0;36m"
FUCHSIA="\033[0;35m"
echo "export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
echo -e "
 ${GREEN} hk
 ${GREEN} jp
 ${GREEN} sgp
 ${GREEN} us
 ${GREEN} kr
 ${GREEN} tw
 "
  read -p "输入地区代号(例如hk):" area
num=`curl -I -m 10 -o /dev/null -s -w %{http_code} h5ai.xinhuanying66.xyz`
if [ $num -eq 301 ]
then 
echo "网站访问状态为${num},可以执行脚本"
cd /root/ && wget -N --no-check-certificate "https://raw.githubusercontent.com/liujang/hy/main/changedns.sh" && chmod +x changedns.sh
wget -N --no-check-certificate "https://raw.githubusercontent.com/liujang/hy/main/dns-change.sh" && chmod +x dns-change.sh
sed -i '9s/area/'${area}'/' /root/changedns.sh
 ./changedns.sh
 echo "已更换dns"
else
echo "网站访问状态为${num},不可以执行脚本，已自动退出"
exit 1
fi
