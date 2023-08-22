#!/bin/bash
a=$(hostnamectl | grep -i 'operating'| awk '{print $3,$4,$5}')
echo "Welcome to ubuntu"
echo
echo "OS_Version : $a "
echo
b=$(free -h | grep -i mem | awk '{print $2}' | sed 's/i/b/g')
echo
echo "RAM : $b "
c=$(free -h | grep -i mem | awk '{print $3}' | sed 's/i/b/g')
echo "Used RAM : $c"
echo
d=$(df -h| grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $1" - " $3"/"$2}' | sort -nk 2 | tail -n 5
)
echo "File system high : used/total "
echo "$d"
echo
e=$(df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print$1" - " $3"/"$2}' | sort -nk 2 | head -n 5)
echo "File system low : used/total"
echo "$e"
f=$(uptime -p | awk '{print $2,$3,$4,$5}')
echo
echo "system Uptime : $f"
echo 
