FROM php:7.4-apache
RUN apt-get update
RUN apt-get install -y wget unzip  libxml2-dev gnupg2
RUN apt-get install -y zlib1g-dev libicu-dev g++ libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev
RUN apt-get install -y libzip-dev libxslt-dev libonig-dev antiword poppler-utils html2text unrtf libldap2-dev 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ 
RUN docker-php-ext-install soap ldap 

RUN docker-php-ext-install zip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install mysqli pdo pdo_mysql intl

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install gettext bcmath xsl mbstring
RUN a2enmod rewrite 

WORKDIR /var/www

RUN  wget https://open.vanillaforums.com/get/vanilla-core-2021.009.zip

RUN unzip vanilla-core-2021.009.zip
RUN mv /var/www/package/* /var/www/html/
WORKDIR /var/www/html/
RUN wget https://github.com/vanilla/vanilla/raw/master/.htaccess.dist
RUN mv .htaccess.dist .htaccess
RUN ls -l

RUN chown www-data:www-data -R ./ && chmod -R 770 uploads cache conf