# symfonySandboxDocker
## Intro
Easy to test environment for the Symfony Framework:  
Embedded commands:
* git
* emacs
* tree
* jq
* wget
* oh-my-zsh
## Howto
Build image, from project's root directory:
```bash
docker build -t symfony:1 .
```
Run image in background, with container's name "symfony":
```bash
docker run -p 80:80 --name symfony -d symfony:1
```
Go inside container for work:
```bash
docker exec -it symfony zsh
```
## Create Symfony Project
```bash
php symfony.phar new Symfony 
chown -R www-data:www-data Symfony
```
From Host, go to http://localhost/Symfony/web/app.php
