wget "https://raw.githubusercontent.com/laravel/settler/master/scripts/provision.sh" >> settler.sh
mv settler.sh.1 settler.sh
chmod +x settler.sh
sudo bash settler.sh

rm settler.sh

wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/aliases" -O ->> /home/$USER/.bash_aliases
source /home/$USER/.profile

rm -rf ~/$USER/.ssh
cp -R /mnt/c/Users/$USER/.ssh ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa

sudo apt purge -y openssh-server
sudo apt install openssh-server
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/settler/scripts/sshd_config" -O ->> /home/$USER/sshd_config
echo "AllowUsers $USER" >> /home/$USER/sshd_config
sudo rm /etc/ssh/sshd_config
sudo mv /home/$USER/sshd_config /etc/ssh/sshd_config
sudo service ssh --full-restart
