sudo wget -P /etc/apt/trusted.gpg.d https://cli-dist.keboola.com/deb/keboola.gpg
echo "deb https://cli-dist.keboola.com/deb /" | sudo tee /etc/apt/sources.list.d/keboola.list
sudo apt-get update
sudo apt-get install keboola-cli