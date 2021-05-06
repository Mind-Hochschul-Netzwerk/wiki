FROM mindhochschulnetzwerk/php-base

LABEL Maintainer="Henrik Gebauer <code@henrik-gebauer.de>" \
      Description="mind-hochschul-netzwerk.de"

COPY docker/assets/ docker/get-resources.sh docker/resources.list /tmp/build/

RUN set -ex \
  && apk --no-cache add \
    php7-mysqli \
    php7-iconv \
    php7-zip \
    php7-simplexml \
    php7-fileinfo \
    php7-tokenizer \
    php7-xmlrpc \
    php7-soap \
    php7-curl \
    php7-ctype \
    php7-gd \
    php7-dom \
    php7-xmlreader \
    php7-json \
    php7-intl \
    php7-mbstring \
    php7-session \
    php7-ldap \
    php7-pdo \
    php7-pdo_mysql \
    curl \
    imagemagick

RUN set -ex \
  && /tmp/build/get-resources.sh \
  && tar --strip-components=1 -C /var/www/html -xzf /tmp/build/mediawiki-*.tar.gz \
  && chown -R nobody:nobody /var/www/html \
  && chown -R www-data:www-data /var/www/html/images \
  && rm -rf /tmp/build \
  && true

COPY config/nginx/ /etc/nginx/
COPY entry.d/ /entry.d/
COPY app/ /var/www/html/

VOLUME /var/www/html/images
