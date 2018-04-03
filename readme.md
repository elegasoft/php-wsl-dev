# A PHP Ubuntu WSL Development Environment Configuration

## Introduction

PHP Ubuntu WSL Development Environment provides you a wonderful development environment without requiring you to manually install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! If something goes wrong, you can destroy and re-create the box in minutes!

Runs on Ubuntu inside the Windows Subsystem for Linux and includes the Nginx web server, PHP 7.2, MySQL, Postgres, Redis, Memcached, Node, and all of the other goodies you need to develop amazing PHP, Laravel, Drupal, Wordpress, and/or Symfony applications.

## Installation

To use the automatic installation script run the following command

```console
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/provision.sh" >> provision.sh
mv provision.sh.1 provision.sh
chmod +x provision.sh
sudo bash provision.sh

sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config
```

## Development Environment Overview

Coding Languages:

* Golang
* PHP 7.2, 7.1, 7.0, and 5.6 (each are installed and switchable with via the command line)

PHP Framework Support:
* Laravel (installers for Laravel, Lumen, Envoy and Spark, plus the Chrome Driver for Laravel Dusk)
* Wordpress (via wp-cli)
* Drupal (via drush/drush)

Node Build Tools:

* npm
* yarn
* gulp-cli
* bower
* grunt-cli

Databases/Datastores:

* MySQL
* PostgreSQL
* SQLite
* Redis
* Memcached

Debuggers/Profilers:

* Xdebug (automatically disabled from the commandline for performance)
* Blackfire

Queue Managers:

* Beanstalkd
* Supervisor

Misc:
* nginx with fpm
* Oh-My-Zsh (zshell)
* MailHog
* Postfix
* ngrok
* apt-fast


## Usage

### Change the runtime version of PHP

Reset to PHP 7.2 (default)

```console
sudo update-alternatives --set php /usr/bin/php7.2
```

Change to PHP 7.1

```console
sudo update-alternatives --set php /usr/bin/php7.1
```

Change to PHP 7.0

```console
sudo update-alternatives --set php /usr/bin/php7.0
```

Change to PHP 5.6

```console
sudo update-alternatives --set php /usr/bin/php5.6
```

### Default Database Authentication

MySQL

* User: ``  root  ``
* Password: ``  secret  ``

PostgreSQL:

* User: ``  homestead  ``
* Password: ``  secret  ``

### SSH Configuration

**Share your Windows installations SSH keys with the development environment**
```console
sudo rm -rf /home/$USER/.ssh
ln -s /mnt/c/Users/$USER/.ssh /home/$USER/.ssh
```

**Configure SSH Login**

1. `` sudo apt-get purge openssh-server ``
2. `` sudo apt-get install openssh-server ``
3. `` sudo nano /etc/ssh/sshd_config `` 
4. Disable privilege separation by adding or setting `` UsePrivilegeSeparation no ``
5. Disallow root login by setting  `` PermitRootLogin no ``
6. Add this line below the above `` AllowUsers yourusername ``
7. (optional) Add this line also `` PasswordAuthentication Yes `` (allows authentication via password)
7. `` sudo service ssh --full-restart ``
8. Connect to your installation using favorite ssh client or in Git Bash you would `` ssh yourusername@127.0.0.1`` and enter the password

