# Usar la imagen oficial de PHP 8.2 con Apache
FROM php:8.2-apache

# Instalar herramientas que PostgreSQL necesita
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

# Instalar los "traductores" para que PHP hable con PostgreSQL
RUN docker-php-ext-install pdo pdo_pgsql

# Copiar todos los archivos del proyecto al servidor
COPY . /var/www/html/

# Asignar permisos correctos
RUN chown -R www-data:www-data /var/www/html
