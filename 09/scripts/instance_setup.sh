#!/bin/bash

sed -i '/Port 22/c\Port INSTANCE_PORT\' /etc/ssh/sshd_config ;
systemctl restart ssh

cd /home/ubuntu
sudo add-apt-repository ppa:deadsnakes/ppa
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt install docker.io software-properties-common -y
sudo apt install python3.8 python3-dev python3-pip apache2 postgresql-client postgresql-client-11 build-essential libssl-dev libffi-dev libsasl2-dev libldap2-dev libmysqlclient-dev libpq-dev git-core curl rsync python-babel jq -y

VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DESTINATION=/usr/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION

timedatectl set-timezone "America/Bogota"