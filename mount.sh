sudo apt-get install nfs-common -y
sudo docker volume create app
sudo ufw allow proto tcp from 10.10.10.0/24 to any port 2049
sudo mount 10.10.10.100:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data