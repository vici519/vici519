#!/bin/bash
cp /var/www/html/uploads/* /root/csp
chown root:root -R /root/csp/*
cp /root/csp/* /var/opt/cprocsp/keys/root
sert=$(/opt/cprocsp/bin/amd64/csptest -keyset -enum_cont -verifycontext -fqcn | grep HDIMAGE)


#echo $sert
/opt/cprocsp/bin/amd64/certmgr -inst -file /key/*.cer -cont "$sert"
/opt/cprocsp/bin/amd64/certmgr -list -store uMy > /opt/sert.txt
