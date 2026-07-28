# Custom PHP + Apache image built from scratch
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache + PHP stack
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy app code into Apache's web root
COPY app/ /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Enable Apache modules commonly needed in production
RUN a2enmod rewrite headers

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
