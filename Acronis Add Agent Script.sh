#!/bin/bash
Latest=`curl -s https://sg-cloud.acronis.com/download/u/baas/4.0/ |   grep -Po '(?<=href=")[0-9]+(\.[0-9]+){2,3}(?=/")' |   sort -Vr | head -1`
wget https://sg-cloud.acronis.com/download/u/baas/4.0/$Latest/CyberProtect_AgentForLinux_x86_64.bin
chmod +x CyberProtect_AgentForLinux_x86_64.bin
echo "Configuring Acronis"
MUPerGBUser="acronis+yotta+pergb+pub2"
MUPerGBPassword="IyPX5HfJg4n3xyP2"
MUPerDeviceUser="acronis-yotta-perdev-pvt"
MUPerDevicePassword="s1kcZ2rCxQU1m2CY"

Disksize=`fdisk -l | grep /dev/vda: | awk '{ print $3}'`
if [[ $Disksize -lt 120  ]]; then
./CyberProtect_AgentForLinux_x86_64.bin -a -g=$MUPerGBUser  -w=$MUPerGBPassword
else
./CyberProtect_AgentForLinux_x86_64.bin -a -g=$MUPerDeviceUser  -w=$MUPerDevicePassword
fi