#!/bin/bash
clear

wget -O - http://autoinstall.plesk.com/one-click-installer | sh >> /root/ins_plesk.log 2>&1
