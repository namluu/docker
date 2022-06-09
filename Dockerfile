FROM php:8.0.16-apache
LABEL maintainer="Nam Luu"
COPY .docker/php/php.ini $PHP_INI_DIR
COPY . /srv/app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN docker-php-ext-install pdo_mysql
