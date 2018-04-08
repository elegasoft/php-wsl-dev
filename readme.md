# A PHP Ubuntu on Windows Development Environment Configuration

## Introduction

This configures a PHP Ubuntu on Windows Development Environment providing you with a wonderful development environment without requiring you to manually install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! If something goes wrong, you can destroy and re-create the box in minutes!

Runs on Ubuntu on Windows inside the Windows Subsystem for Linux and includes the Nginx web server, PHP 7.2, MySQL, Postgres, Redis, Memcached, Node, and all of the other goodies you need to develop amazing PHP, Laravel, Drupal, Wordpress, and/or Symfony applications.

## Installation

From a fresh installation of Ubuntu on Windows from the Windows Store run the following installation commands from the Ubuntu terminal.
```console
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/provision.sh" >> provision.sh
mv provision.sh.1 provision.sh
chmod +x provision.sh
bash provision.sh
```

After about an hour of setting up you are all set to go.

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
Run any of the following from the WSL command shell:

* Reset to PHP 7.2 (default)

```console
php72
```

* Change to PHP 7.1

```console
php71
```

* Change to PHP 7.0

```console
php70
```

* Change to PHP 5.6

```console
php56
```

### Default Database Authentication

MySQL

* User: ``  root  ``
* Password: ``  secret  ``

PostgreSQL:

* User: ``  homestead  ``
* Password: ``  secret  ``

## SSH Configuration

### Share your Windows installations SSH keys with the development environment ###

The following will create a symlink to your Windows Hosts .ssh folder. If your usernames are not the same be sure to change them here.
```console
sudo rm -rf /home/$USER/.ssh
ln -s /mnt/c/Users/$USER/.ssh /home/$USER/.ssh
```

### Configure SSH Login ###

1. `` sudo apt-get purge openssh-server ``
2. `` sudo apt-get install openssh-server ``
3. `` sudo nano /etc/ssh/sshd_config `` 
4. Disable privilege separation by adding or setting `` UsePrivilegeSeparation no ``
5. Disallow root login by setting  `` PermitRootLogin no ``
6. Add this line below the above `` AllowUsers yourusername ``
7. (optional) Add this line also `` PasswordAuthentication Yes `` (allows authentication via password)
7. `` sudo service ssh --full-restart ``
8. Connect to your installation using favorite ssh client or in Git Bash you would `` ssh yourusername@127.0.0.1`` and enter the password

Note: You will need to start the SSH Server after each login, alternatively, see [How to automatically start ssh server on boot on Windows Subsystem for Linux](https://gist.github.com/dentechy/de2be62b55cfd234681921d5a8b6be11) by dentechy for how to configure the SSH Server to start automatically with Windows.

### Re/Starting the SSH Server ###

If you have already configured the SSH Server and after a restart you notice that you have lost SSH connectivity run ``` ssh_restart ``` from the Bash/Ubuntu command line.

## Using MailHog

