#!/bin/bash
#################################
# Author : Anil Amrute
# Date : 28/01/2026
#
# This script ouput node health
# version v1
#
###################################

set -x # debug mode show what excute in script 
set -e # exit the script , when there is error
set -o # pipefail

echo "print the diskspace"
df -h 

echo "print the memory"
free -g

echo "print the cpu"
nproc

ps -ef | grep "jenkin" | awk -f " " '{print $2}'

