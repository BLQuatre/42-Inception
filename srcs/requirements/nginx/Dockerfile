FROM alpine:3.21.2

RUN apk update --no-cache \
&& apk add --no-cache nginx openssl \
&& mkdir -p /etc/nginx/ssl /var/run/nginx /var/www/wordpress \
&& rm /etc/nginx/http.d/default.conf \
&& openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN sed -i 's/^\(\s*\)ssl_protocols\s\+.*/\1ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/nginx.conf

COPY conf/wordpress.conf /etc/nginx/http.d/wordpress.conf

# RUN chmod 755 /var/www/wordpress \
# && adduser -D -g 'www' www \
# && chown -R www:www /var/www/wordpress

CMD [ "nginx", "-g", "daemon off;" ]
