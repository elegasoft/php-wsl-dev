# A PHP Ubuntu on Windows Development Environment Configuration

## Introduction

This configures a PHP Ubuntu on Windows Development Environment providing you with a wonderful development environment without requiring you to manually install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! If something goes wrong, you can destroy and re-create the setup with a few simple commands!

The development environment runs on Ubuntu on Windows inside the Windows Subsystem for Linux and includes the Nginx web server, PHP 7.2, MySQL, Postgres, Redis, Memcached, Node, and all of the other goodies you need to develop amazing PHP, Laravel, Drupal, Wordpress, and/or Symfony applications.

## Installation

For best results start with a fresh installation of Ubuntu 16.04 on Windows with a username of `` vagrant ``.  From a fresh installation of Ubuntu on Windows from the Windows Store run the following installation commands from the Ubuntu terminal.

This installation script runs the [Laravel Homestead](https) provision script on your Ubuntu on Windows installation and applies several tweaks for use with Ubuntu on Windows.

```console
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/provision.sh" >> provision.sh
mv provision.sh.1 provision.sh
chmod +x provision.sh
sudo bash provision.sh
```

After about an hour of setting up you are all set to go.

### Bash Alias Configuration

If the installation does not automatically link the aliases which are relied upon in the rest of this guide, please run the following commands in the Ubuntu on Windows shell.

```console
rm /home/$USER/.bash_aliases
wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/master/scripts/aliases" -O ->> /home/$USER/.bash_aliases
source /home/$USER/.profile
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

### Viewing a website in your browser ###

Using the Ubuntu on Windows command shell, navigate to your current project's root folder and enter `` php artisan serve `` or `` art serve `` and by default the website should be available at [http://localhost:8000](http://localhost:8000). 

If you would like ot change the port from 8000 to another port such as 8888 you can do so as follows: `` php artisan serve -p 8888 `` or `` art serve -p 8888 ``.

### Default Database Authentication

MySQL

* Host: ``  localhost  ``
* Port: ``  3306  ``
* Database: ``  homestead  ``
* User: ``  homestead  ``
* Password: ``  secret  ``

PostgreSQL:

* Host: ``  localhost  ``
* Port: ``  5432  ``
* Database: ``  homestead  ``
* User: ``  homestead  ``
* Password: ``  secret  ``

### Changing the runtime version of PHP
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

### PHP Xdebug ###

Enter one of the following commands in the Ubuntu on Windows console:
* `` xon `` -- To turn on Xdebug
* `` xoff `` -- To turn off Xdebug

## SSH Configuration

### Copying your host Windows SSH keys to the development environment ###

The following will copy to your host Windows .ssh folder to the Ubuntu on Windows .ssh folder. If the usernames of your host Windows and Ubuntu on Windows installations are not the same be sure to change each of the `` $USER `` references below to the username for your host Windows.
```console
rm -rf ~/$USER/.ssh
cp -R /mnt/c/Users/$USER/.ssh ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa
```

### Configure SSH Login ###

SSH logon should be available immediately after installation, however, if you are experiencing problems with the installation, please try the following.

1. `` sudo apt purge openssh-server ``
2. `` sudo apt install openssh-server ``
3. `` sudo nano /etc/ssh/sshd_config `` 
4. `` wget "https://raw.githubusercontent.com/elegasoft/php-wsl-dev/settler/scripts/sshd_config" -O ->> /home/$USER/sshd_config ``
5. `` echo "AllowUsers $USER" >> /home/$USER/sshd_config ``
6. `` sudo rm /etc/ssh/sshd_config ``
7. `` sudo mv /home/$USER/sshd_config /etc/ssh/sshd_config ``
8. `` sudo service ssh --full-restart ``
9. Connect to your installation using favorite ssh client or in Git Bash you would `` ssh yourusername@127.0.0.1`` and enter the password

Note: You will need to start the SSH Server after each login, alternatively, see [How to automatically start ssh server on boot on Windows Subsystem for Linux](https://gist.github.com/dentechy/de2be62b55cfd234681921d5a8b6be11) by dentechy for how to configure the SSH Server to start automatically with Windows.

### Re/Starting the SSH Server ###

If you have already configured the SSH Server and after a restart you notice that you have lost SSH connectivity run ``` ssh_restart ``` from the Bash/Ubuntu command line.

## PHPStorm Integrations

### Setting the Ubuntu on Windows terminal as the default PHPStorm terminal shell
Navigate to `` File >> Settings >> Tools >> Terminal `` and enter `` C:\Windows\System32\bash.exe `` as the path to the shell.

### Configuring a Deployment Server
Navigate to `` Tools >> Deployment >> Configuration `` and add a new configuration with the following and enter your password.
* Type: `` SFTP ``
* SFTP host: `` 127.0.0.1 `` 
* Port: `` 22 ``
* User name: `` vagrant ``
* Auth type: `` Password ``

### Setting Up the PHP Interpreter
Please ensure you have already configured a as noted above
1. Navigate to `` File >> Settings >> Languages & Frameworks >> PHP `` and find CLI Interpreter and click on the `` ... `` at the end of the line. 
2. The CLI Interpreters window should open and click the `` + `` to add a new configuration.
3. Enter the following in the configuration:
  *  Choose Deployment configuration from the radio select list.
  *  Select the Deloyment Server you configured in the *Configuring a Deployment Server* section.
  *  In the following General section, enter `` /usr/bin/php7.2 ``, `` /usr/bin/php7.1 ``, `` /usr/bin/php7.0 ``, or `` /usr/bin/php5.6 `` as the path to the PHP executable, then click on the refresh button to validate the path and ensure that you receive a success message.
Note: It is recommended that repeat this process for all 4 versions of the availble PHP interpreters now.
  *  Click Apply and then select OK to close the window.
4. Configuring the Path Mappings (this is done a project level basis and required for PHPUnit to run successfully)
  *  At the `` File >> Settings >> Languages & Frameworks >> PHP `` settings menu find `` Path mappings `` and select the `` ... `` at the end of the line.
  *  Ensure your local path maps to the Windows on Ubuntu path to the same location.
    * Local Path of: ``C:\Users\JohnDoe\Code\Laravel`` should have a remote path of ``/mnt/c/Users/JohnDoe/Code/Laravel `` (note: the paths are case sensitive)
    
### Configuring PHPUnit as a Test Framework
This step requires you have already completed each of the above steps under PHPStorm Intergrations.

1. Navigate to `` File >> Settings >> Languages & Frameworks >> PHP >> Test Frameworks `` and click on the `` + `` to add a new configuration and, if asked, select PHPUnit by Remote Interpreter.
2. Select an interpreter from the list.
3. If you would like to see phpunit's **code coverage reports** find `` Path mappings `` and select the `` ... `` at the end of the line and in the new window ensure that you have again matched the local and remote paths as you did in `` Setting Up the PHP Interpreter ``
  * A local Path of: ``C:\Users\JohnDoe\Code\Laravel`` should have a remote path of ``/mnt/c/Users/JohnDoe/Code/Laravel `` (note: the paths are case sensitive)
4. In the PHPUnit Library section select use Composer library and choose the path to your projects remote vendor/autoload.php file (e.g. `` /mnt/c/Users/JohnDoe/Code/Laravel/vendor/autoload.php `` and click on the refresh button to validate the currently installed PHPUnit Version.
5. In the Test Runner section check the box next to `` Default configuration file `` and click on the `` ... `` and enter the remote path to your projects phpunit.xml file (e.g. `` /mnt/c/Users/JohnDow/Code/Laravel/phpunit.xml ``)
    
### Setting up PHPUnit as Run Configuration
This step requires you have already completed each of the above steps under PHPStorm Intergrations.

1. Navigate to `` Run >> Edit Configurations `` and select the `` + `` and select PHPUnit from the Add New Configuration select list.
2. Under the section for Test Runner find `` Test Scope `` and choose the `` Defined in the configuration file `` option.
3. (Optional but Highly Recommended): You may want to add the following `` Environment Variables ``, as I have found it to significantly reduce unexpected errors when running PHPUnit.
  * name: `` APP_ENV `` value: `` testing ``
  * name: `` DB_CONNECTION `` value: `` sqlite ``
  * name: `` DB_DATABASE `` value: `` :memory: ``
  
(Note: If you are still receiving unexpected errors, be sure to clear your route cache (`` php artisan route:clear ``) and config cache (`` php artisan config:clear ``) prior to running PHPUnit.)
  
## Broken Packages/Services

* Laravel Valet -- This currently does not work because Windows manages the proxy/networking service and does not hand off the responsibility to Linux.

* Mailhog -- When starting the service I have received several errors which have yet to be resolved. While was working in my initial testing since the installation of the Windows 10 April 2018 update it is no longer working.

* PostgreSql -- There seems to be an intermitten issue where users are unable to connect to the Postgres database. Further investigation is necessary.

