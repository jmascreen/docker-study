FROM php:8.0-apache AS base 
#USER doja-01
RUN apt-get update && apt-get install -y --no-install-recommends curl 

WORKDIR /var/www/html

COPY index.html index.html
COPY test.php test.php

FROM base AS dev
ENV PHP_ENV=development

FROM base AS final
COPY . .
EXPOSE 80



