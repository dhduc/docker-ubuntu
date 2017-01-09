FROM ubuntu:16.04
MAINTAINER Duc Dao

ENV TERM xterm

# Update
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install software-properties-common python3-software-properties -y

# Git
RUN apt-get install git git-core -y 

# Zsh
RUN apt-get install zsh -y 

# Java
RUN add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer

# Nginx
RUN apt-get install nginx -y

# PHP
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.0-fpm
# RUN apt-get install --allow-unauthenticated -y libapache2-mod-php7.0 php7.0-dev php7.0-mysql php7.0-cli php7.0-gd php7.0-json -y

# MySQL
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install mysql-server

# Composer
RUN apt-get install curl -y 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# NodeJS
RUN apt-get install nodejs nodejs-legacy -y 
RUN apt-get install npm -y
RUN npm install -g grunt-cli 

# Ruby
RUN apt-get install ruby ruby-bundler -y
RUN gem update --system
RUN gem install sass

# Tools
RUN apt-get install wget -y       
RUN apt-get install vim -y       
RUN apt-get install sshpass -y
RUN apt-get install htop -y
RUN apt-get install ranger -y
RUN apt-get install sl -y
RUN apt-get install nmap -y
RUN apt-get install tmux -y
RUN apt-get install xclip -y
RUN apt-get install cowsay -y
RUN apt-get install figlet -y
RUN apt-get install lolcat -y
RUN apt-get install boxes -y

# Restart
RUN chown `whoami`:www-data -R /var/www/html
RUN find /var/www/html -type d -exec chmod 775 {} \;
RUN find /var/www/html -type f -exec chmod 664 {} \;
RUN service nginx start
RUN service php7.0-fpm restart

EXPOSE 8000