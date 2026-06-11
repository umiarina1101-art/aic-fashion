FROM php:8.2-apache

# Fix MPM dengan cara berbeda
RUN sed -i 's/^/#/' /etc/apache2/mods-enabled/mpm_event.load 2>/dev/null || true
RUN sed -i 's/^/#/' /etc/apache2/mods-enabled/mpm_event.conf 2>/dev/null || true

RUN a2enmod mpm_prefork
RUN a2enmod rewrite

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80