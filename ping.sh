#!/bin/bash

#$API_KEY = 934556127:AAEtWQux1JzI6D2jESIv-qjs-oWmfcDju4U
#$CHAT_ID = -488166333

IP=$(hostname -I)
echo $IP

ping -c3 -i3 vetrf.ru
if [ $? -eq 0 ]
then echo “ok”
#curl -s "https://api.telegram.org/bot934556127:AAEtWQux1JzI6D2jESIv-qjs-oWmfcDju4U/sendMessage?chat_id=-488166333&text=доступен vetrf.ru с адреса $IP"


exit 0
else echo “fail”
curl -s "https://api.telegram.org/bot934556127:AAEtWQux1JzI6D2jESIv-qjs-oWmfcDju4U/sendMessage?chat_id=-488166333&text=нет доступа к vetrf.ru с адреса $IP"

fi
