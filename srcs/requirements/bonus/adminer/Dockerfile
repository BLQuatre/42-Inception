FROM alpine:3.21.2

WORKDIR /var/www/adminer

RUN apk update --no-cache \
&& apk add --no-cache wget php83 php83-mysqli php83-session \
&& wget -O index.php https://github.com/vrana/adminer/releases/download/v5.1.0/adminer-5.1.0.php \
&& wget -O adminer.css https://raw.githubusercontent.com/vrana/adminer/v5.1.0/designs/galkaev/adminer-dark.css

CMD [ "php", "-S", "0.0.0.0:80", "-t", "."]
