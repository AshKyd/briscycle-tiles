FROM php:7.2-apache
RUN  apt-get update \
  && apt-get install -y wget git \
  && git clone https://github.com/maptiler/tileserver-php.git /var/www/html/ \
  && wget http://bigdisk/briscycle/seq.mbtiles -P /var/www/html/