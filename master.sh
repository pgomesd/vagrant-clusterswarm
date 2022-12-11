#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.10.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
sudo docker volume create app
sudo docker volume create data
sudo apt-get install nfs-server -y
sudo echo '/var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)' >> /etc/exports
sudo ufw allow proto tcp from 10.10.10.0/24 to any port 2049
sudo exportfs -ar
sudo docker run -e MYSQL_ROOT_PASSWORD=Senha123 -e MYSQL_DATABASE=testedb --name mysqlA -d -p 3306:3306 --mount type=volume,src=data,dst=/var/lib/mysql/ mysql:5.7