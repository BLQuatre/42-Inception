FROM alpine:3.21.2

RUN apk update --no-cache \
&& apk add --no-cache vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

CMD ["/tools/script.sh"]
