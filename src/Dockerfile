FROM php:7.4-apache as base

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ rc main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update \
  && apt-get install -y wget unzip git libxml2-dev gnupg2 nodejs yarn \
  zlib1g-dev libicu-dev g++ libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev \
  libzip-dev libxslt-dev libonig-dev antiword poppler-utils html2text unrtf libldap2-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
  && docker-php-ext-configure intl \
  && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
  && docker-php-ext-install soap ldap zip mysqli pdo pdo_mysql intl gd gettext bcmath xsl mbstring \
  && a2enmod rewrite \
  && service apache2 restart

FROM base AS installer

ARG vanilla_version=2022.018

WORKDIR /var/www/html
RUN wget https://github.com/vanilla/vanilla/archive/refs/tags/${vanilla_version}.zip \
  && unzip ${vanilla_version}.zip \
  && cp -ruv vanilla-${vanilla_version}/* /var/www/html \
  && cp -ruv vanilla-${vanilla_version}/.* /var/www/html || true \
  && rm -rf vanilla-${vanilla_version} \
  && rm ${vanilla_version}.zip

RUN mv .htaccess.dist .htaccess \
  && chown -R www-data:www-data * \
  && composer install --no-dev --optimize-autoloader \
  && npm prune --production \
  && chown www-data:www-data -R ./ && chmod -R 770 uploads cache conf

FROM base

COPY --from=installer /var/www/html /var/www/html
