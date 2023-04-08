#!/bin/bash
date
checkServiceRunning(){
if systemctl is-active --quiet $1 > /dev/null 2>&1;then
echo "$1 Running"
else
systemctl restart $1
fi
}

checkServiceRunning nginx
