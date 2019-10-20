#!/bin/bash
mkdir -p /etc/apt/sources.list.d
touch /etc/apt/sources.list.d/nginx.list

cp ./conf/nginx.repo /etc/apt/sources.list.d/nginx.list

wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
apt update

apt remove -y nginx nginx-common nginx-full nginx-core
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

apt install -y nginx
nginx -t
nginx -v
/lib/systemd/systemd-sysv-install enable nginx
service nginx start
service nginx status

apt install -y php-fpm
service  php7.2-fpm start
service  php7.2-fpm status
apt install -y php7.2-cli
apt install -y php7.2-mysql
apt install -y php7.2-soap
apt install -y php7.2-xml
apt install -y php7.2-zip
apt install -y php7.2-json
apt install -y php7.2-mbstring
apt install -y php7.2-gd

#apt-get update
#apt install -y ufw
#ufw status verbose
#ufw enable
