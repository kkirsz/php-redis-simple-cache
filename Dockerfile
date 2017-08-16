FROM php:7.1.8-cli
WORKDIR /usr/src/php-redis-simple-cache
ADD . /usr/src/php-redis-simple-cache
RUN apt-get update \
    && apt-get install -y git zlib1g-dev \
    && docker-php-ext-install zip \
    && pecl install redis-3.1.3 \
    && pecl install xdebug-2.5.5 \
    && docker-php-ext-enable redis xdebug \
    && curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer
