FROM trafex/php-nginx:3.1.0

LABEL Maintainer="Henrik Gebauer <code@henrik-gebauer.de>" \
      Description="mind-hochschul-netzwerk.de"

HEALTHCHECK --interval=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping

USER root

RUN apk --no-cache add \
    php81-ldap \
    php81-zip \
    php81-pdo_mysql \
    php81-iconv \
    php81-simplexml \
    php81-tokenizer \
    php81-soap \
    php81-fileinfo \
    php81-pdo \
    imagemagick \
  && chown nobody:nobody /var/www

COPY --chown=nobody docker/assets/ docker/get-resources.sh docker/resources.list /tmp/build/

COPY config/nginx/ /etc/nginx
COPY --chown=nobody app/ /var/www

RUN set -ex \
  && /tmp/build/get-resources.sh \
  && tar --strip-components=1 -C /var/www/html -xzf /tmp/build/mediawiki-*.tar.gz \
  && rm -rf /tmp/build \
  && echo -e "[program:wiki-maintenance]\ncommand=php /var/www/html/maintenance/update.php\nautorestart=false" >> /etc/supervisor/conf.d/supervisord.conf

USER nobody

VOLUME /var/www/html/images
