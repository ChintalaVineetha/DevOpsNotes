#!/bin/bash

# Install Java
#sudo apt-get update
#sudo apt-get install default-jdk -y
d=$(java --version | grep 'openjdk' | awk '{print $1,$2}')
echo "Java version:$d"

echo
echo
#Install Maven
#sudo apt-get install maven -y
a=$(mvn -version)
echo "Maven version:$a"
echo
echo
# Install Git
#sudo apt-get install git -y

b=$(git --version | awk '{print $3}')
echo "git version: $b"
echo
e=$(psql --version)
echo "postgresql version: $e"

#install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins.service
#systemctl start jenkins.service
sudo systemctl status jenkins.service
sudo ufw allow 8080
sudo ufw allow ssh


#if above doesn't work
 wget http://archive.ubuntu.com/ubuntu/pool/universe/d/daemon/daemon_0.6.4-1_amd64.deb
 sudo dpkg -i daemon_0.6.4-1_amd64.deb
 sudo dpkg -i jenkins_2.289.1_all.deb
 sudo apt --fix-broken install
 sudo systemctl start jenkins
 sudo apt install jenkins


#install docker
sudo apt update
sudo apt upgrade
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

