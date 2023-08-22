#!/bin/bash
a=$(hostnamectl | grep -i 'operating'| awk '{print $3,$4,$5}')
echo "Welcome to $a"
echo
pi=$(curl ifconfig.me)
echo "public_ip:$pi"
f=$(uptime -p | awk '{print $2,$3,$4,$5}')
echo
de=$(date | awk '{print $2,$3,$4}')
echo "Today date is $de"
echo
b=$(free -h | grep -i mem | awk '{print $2}' | sed 's/i/b/g')
echo "Total_RAM: $b "
c=$(free -h | grep -i mem | awk '{print $3}' | sed 's/i/b/g')
echo "Used_RAM: $c"
fr=$(free -h | grep -i mem | awk '{print $4}' | sed 's/i/b/g')
echo "Free_RAM: $fr"
echo
d=$(df -h| grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $1":" $3"/"$2}' | sort -nk 2 | tail -n 5)
echo "File system:"
echo "$d"
echo

echo "System Uptime: $f"
echo 
ja=$(java --version | grep 'openjdk' | awk '{print $1,$2}')
echo "Java_Version: $ja"
echo
mvn=$(mvn --version | grep -i 'apache' |awk '{print $3}')
echo "Maven_Version:$mvn"
echo
git=$(git --version | awk '{print $3}')
echo "Git_Version:$git"
echo



