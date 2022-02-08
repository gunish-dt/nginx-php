FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install php7.0 \
      php7.0-cli \
      php-fpm 
      
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nginx-full
ADD config/nginx/nginx-site.conf /etc/nginx/sites-available/default

WORKDIR /var/www/html/

RUN mkdir -p /run/php

COPY ./code /var/www/html

EXPOSE 80

CMD /usr/sbin/nginx; /usr/sbin/php-fpm7.0 -F