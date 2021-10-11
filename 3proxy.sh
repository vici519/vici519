#!/bin/bash
yum -y install 3proxy
ip=$(curl ifconfig.me)
echo $ip
mv /etc/3proxy.cfg /etc/3proxy_original
touch /etc/3proxy.cfg
cat > /etc/3proxy.cfg <<EOF
nserver 77.88.8.8
nserver 8.8.8.8
nscache 65536
timeouts 1 5 30 60 180 1800 15 60
external $ip
internal $ip
daemon
log /var/log/3proxy/3proxy.log D
logformat "- +_L%t.%. %N.%p %E %U %C:%c %R:%r %O %I %h %T"
rotate 30
auth iponly
allow * 62.171.137.74,5.45.76.45,5.45.75.191
deny * * * * * * *
allow * * * 80-88,8080-8088 HTTP
allow * * * 443,8443 HTTPS
EOF
firewall-cmd --add-port=3128/tcp
firewall-cmd --runtime-to-permanent
systemctl enable 3proxy
systemctl start 3proxy
systemctl status 3proxy