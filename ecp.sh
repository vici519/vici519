#!/bin/bash

valid_name=$(/opt/cprocsp/bin/amd64/certmgr -list | grep 'Subject' | sed 's|.*SN=||')
valid_date=$(/opt/cprocsp/bin/amd64/certmgr -list | grep 'Not valid after' | awk '{ print $5 }')
#| tr '/' '.')
t=$(date -d $valid_date +%y%m%d)
timestamp=$(date +%y%m%d)
let DIFF=($(date +%s -d $t)-$(date +%s -d $timestamp))/86400

echo $DIFF
echo $valid_name

if [ $DIFF -le 341 ]
then
  
  curl -s "https://api.telegram.org/bot1346124292:AAHiysCMZPWrKR6b-Jag9DxFojI0vdLjFZo/sendMessage?chat_id=-822967270&text"="Внимание! До конца действия ЭЦП $valid_name осталось $DIFF дней"
  
fi





