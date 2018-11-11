FROM php:7.1-apache

# Install essentials
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y zsh emacs-nox git tree wget less zip --no-install-recommends \
    && rm -r /var/lib/apt/lists/* 

# Install oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh

COPY ./source/.zshrc /root/.zshrc

# Install jq
RUN cd /opt \ 
    && mkdir jq \
    && wget -O ./jq/jq http://stedolan.github.io/jq/download/linux64/jq \
    && chmod +x ./jq/jq \
    && ln -s /opt/jq/jq /usr/local/bin

# Get symfony.phar
RUN wget -O /var/www/html/symfony.phar http://symfony.com/installer

