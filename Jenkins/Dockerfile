FROM node:20 AS build

WORKDIR /app

# Copy only Angular source
COPY ./ordo-admin .

# Install deps
RUN npm install --legacy-peer-deps
RUN npm install jspdf --legacy-peer-deps

# Build production Angular
RUN npm run build --configuration=production

# Result will be here:
# /app/dist/sanordo-admin/browser


############################################
# Stage 2 – PHP 8.3 + Apache
############################################
FROM php:8.3-apache

# System deps
RUN apt-get update && apt-get install -y \
    nano vim curl unzip git pkg-config \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    libzip-dev libxml2-dev libldap2-dev libssl-dev \
    libsodium-dev libssh2-1-dev libonig-dev libicu-dev \
    librdkafka-dev \
    && rm -rf /var/lib/apt/lists/*

# Apache modules
RUN a2enmod rewrite headers ssl

# PHP extensions
RUN docker-php-ext-install \
    mysqli pdo pdo_mysql zip xml mbstring ldap gd opcache sodium

# PECL
RUN pecl install ssh2 rdkafka \
 && docker-php-ext-enable ssh2 rdkafka

# Document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/ordo-admin
RUN sed -ri \
    -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf

# SSL
COPY ./ssl /etc/apache2/ssl
COPY ./ssl-vhost.conf /etc/apache2/sites-available/cloudext-ssl.conf
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2ensite cloudext-ssl

############################################
# Copy ONLY the built Angular output
############################################
COPY --from=build /app/dist/sanordo-admin/browser /var/www/html/ordo-admin

# Permissions
RUN chown -R www-data:www-data /var/www/html/ordo-admin \
 && chmod -R 755 /var/www/html/ordo-admin

EXPOSE 80 443
