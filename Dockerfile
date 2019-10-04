FROM php:5.6.14-apache


RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
    curl \
    wget \
    vim 
RUN service apache2 start    

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/symfony
EXPOSE 80
