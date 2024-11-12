FROM debian:bookworm-slim AS src
LABEL Description="Tilemaker" Version="1.4.0"

ARG BUILD_DEBUG=

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    liblua5.1-0-dev \
    libsqlite3-dev \
    libshp-dev \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-system-dev \
    luarocks \
    rapidjson-dev \
    cmake \
    git && \
    rm -rf /var/lib/apt/lists/* && \
    luarocks install luaflock &&\
    git clone https://github.com/systemed/tilemaker.git && \
    cd tilemaker && \
    make && \
    make install

# FROM php:7.2-apache
# RUN  apt-get update \
#   && apt-get install -y wget git \
#   && git clone https://github.com/maptiler/tileserver-php.git /var/www/html/ \
#   && wget http://bigdisk/briscycle/seq.mbtiles -P /var/www/html/ \
#   && git clone https://github.com/klokantech/klokantech-gl-fonts /var/www/html/fonts \
#   && mv '/var/www/html/fonts/KlokanTech Noto Sans Bold' /var/www/html/fonts/Bold \
#   && mv '/var/www/html/fonts/KlokanTech Noto Sans Regular' /var/www/html/fonts/Regular \
#   && echo '\nHeader add Access-Control-Allow-Origin "*"' >> /var/www/html/fonts/.htaccess \
#   && echo 'Header add Access-Control-Allow-Methods: "*"' >> /var/www/html/fonts/.htaccess \
#   && a2enmod rewrite headers