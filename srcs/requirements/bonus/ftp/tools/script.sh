#!/bin/sh

set -e

adduser -D -h /home/ftp -s /sbin/nologin ${FTP_USER}

echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd \
echo "${FTP_USER}" >> /etc/vsftpd/allowed_users

chown -R ${FTP_USER}:${FTP_USER} /home/ftp

exec vsftpd /etc/vsftpd/vsftpd.conf
