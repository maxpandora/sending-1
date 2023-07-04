FROM php:7.2-apache 
LABEL Name=sending Version=0.0.1
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev 
RUN docker-php-ext-install pdo mysqli gd iconv
RUN docker-php-ext-install mbstring
RUN docker-php-ext-enable mysqli pdo mbstring 
EXPOSE 80