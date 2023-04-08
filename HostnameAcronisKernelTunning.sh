#!/bin/bash
hostname
hostname -i
acropsh -m dmldump -s mms -vs "Msp::Agent::Dto::Configuration" | grep UserName
grep -i "kernel tuning" /etc/sysctl.conf
grep "^\*" /etc/security/limits.conf
