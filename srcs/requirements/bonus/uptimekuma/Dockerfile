FROM alpine:3.21.2

WORKDIR /app

RUN apk update --no-cache \
&& apk add --no-cache nodejs npm git gettext-envsubst apache2-utils sqlite \
&& git clone https://github.com/louislam/uptime-kuma.git . \
&& npm run setup

COPY tools/init.sql /tools/init.sql
COPY tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

ENTRYPOINT ["/tools/script.sh"]
