echo "-----------------------------"
echo "---------- Docker ----------"
echo "-----------------------------"
apt update

apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt-cache policy docker-ce
apt install -y docker-ce
usermod -aG docker ${USER}


echo "-----------------------------"
echo "------- Docker Compose ------"
echo "-----------------------------"
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "-----------------------------"
echo "--------- Version Info ------"
echo "-----------------------------"
docker -v
docker-compose -v
echo "-----------------------------"
echo "------- Docker Status  ------"
echo "-----------------------------"
systemctl status docker
exit(0)