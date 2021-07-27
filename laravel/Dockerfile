FROM php:7.4-cli

WORKDIR /var/www

RUN apt-get update && apt-get upgrade -y && \
    # lib para ajudar na instalação do laravel
    apt-get install libzip-dev -y && \
    # extensão docker para php
    docker-php-ext-install zip

# instalando o composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');"

# instalação do laravel
RUN php composer.phar create-project --prefer-dist laravel/laravel laravel

# rodando o server do laravel dentro do container
ENTRYPOINT ["php","laravel/artisan","serve"]

# passanso via comando o host como parametro
CMD ["--host=0.0.0.0"]

