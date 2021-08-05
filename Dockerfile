FROM php:7.3.28-apache

# Add Maintainer Info
LABEL maintainer="Injamul Mohammad Mollah <mrinjamul@gmail.com>"
# Install required packages for php modules
RUN apt-get update -y && apt-get install -y \
  libwebp-dev \
  libjpeg62-turbo-dev \
  libxpm-dev \
  libfreetype6-dev \
  libpng-dev \
  && rm -rf /var/lib/apt/lists/*
# Install php modules
RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
  --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir

RUN docker-php-ext-install pdo pdo_mysql mbstring fileinfo gettext exif gd
# reload apache server
RUN a2enmod rewrite

