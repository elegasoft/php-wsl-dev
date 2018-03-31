# A PHP Ubuntu WSL Development Environment Configuration

## Introduction

PHP Ubuntu WSL Development Environment provides you a wonderful development environment without requiring you to manually install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! If something goes wrong, you can destroy and re-create the box in minutes!

Runs on Ubuntu inside the Windows Subsystem for Linux and includes the Nginx web server, PHP 7.2, MySQL, Postgres, Redis, Memcached, Node, and all of the other goodies you need to develop amazing PHP, Laravel, Drupal, Wordpress, and/or Symfony applications.

## Installation

```sh
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/provision.sh" >> provision.sh
mv provision.sh.1 provision.sh
chmod +x provision.sh
sudo bash provision.sh
```

## Development Environment Overview

Coding Languages:

* Golang
* PHP 7.2, 7.1, 7.0, and 5.6 (each are installed and switchable with via the command line)

Node Build Tools

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


