FROM php:8.2-apache

# Fix error MPM - WAJIB ADA INI
RUN a2dismod mpm_event mpm_worker mpm_prefork \
    && a2enmod mpm_prefork

# Aktifkan mod_rewrite
RUN a2enmod rewrite

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80