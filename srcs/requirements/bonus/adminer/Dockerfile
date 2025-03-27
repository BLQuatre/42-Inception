FROM alpine:3.21.2

WORKDIR /var/www/adminer

RUN apk update --no-cache \
&& apk add --no-cache wget php83 php83-mysqli php83-session \
&& wget -O index.php https://github.com/vrana/adminer/releases/download/v4.17.1/adminer-4.17.1.php \
&& wget -O adminer.css https://raw.githubusercontent.com/vrana/adminer/v5.1.0/designs/galkaev/adminer-dark.css

CMD [ "php", "-S", "0.0.0.0:80", "-t", "."]
