FROM alpine:3.21.2

RUN apk update --no-cache \
&& apk add --no-cache wget php83 php83-mysqli php83-session \
&& mkdir -p /var/www/adminer \
&& wget -O /var/www/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.17.1/adminer-4.17.1.php

CMD [ "php", "-S", "0.0.0.0:80", "-t", "/var/www/adminer"]
