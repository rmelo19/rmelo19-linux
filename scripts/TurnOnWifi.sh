sudo head -n -1 /etc/network/interfaces >> /home/rodrigomarques/interfaces.tmp &&
sudo rm /etc/network/interfaces &&
sudo mv /home/rodrigomarques/interfaces.tmp /etc/network/interfaces &&
sudo service network-manager restart