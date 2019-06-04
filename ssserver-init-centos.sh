#!/bin/bash
sudo yum -y install epel-release
sudo yum -y install python-pip
sudo yum -y install git
sudo yum -y install firewalld

sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master

sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=8088/tcp --permanent
sudo firewall-cmd --complete-reload
sudo ssserver -p 8088 -k wjy@shadowsocks -m aes-256-cfb --user nobody -d start