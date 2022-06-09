FROM php:8.0.16-apache
LABEL maintainer="Nam Luu"
COPY .docker/php/php.ini $PHP_INI_DIR
COPY . /srv/app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && a2enmod rewrite negotiation \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY .docker/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY .docker/php/xdebug-dev.ini /usr/local/etc/php/conf.d/xdebug-dev.ini

RUN chown -R www-data:www-data /srv/app
