FROM php:8.2-apache

# Instalar dependências necessárias para a extensão pgsql
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar os arquivos do projeto
COPY src/ /var/www/html/

# Instalar extensões PHP, incluindo pgsql
RUN docker-php-ext-install pdo pdo_mysql pgsql

# Habilitar o módulo rewrite do Apache
RUN a2enmod rewrite

# Expor a porta 80
EXPOSE 80