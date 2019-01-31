#!/usr/bin/env bash

sed -i "s|#ServerName www\.example\.com:80|ServerName $HOSTNAME:80|g" /etc/httpd/conf/httpd.conf
sed -i "s|AllowOverride None|AllowOverride All|g" /etc/httpd/conf/httpd.conf

sed -i "s|memory_limit = 128M|memory_limit = 2048M|g" /etc/php.ini
sed -i "s|;date\.timezone =|date.timezone = 'Asia/Bangkok'|g" /etc/php.ini

echo "NETWORKING=yes" > /etc/sysconfig/network

/etc/init.d/httpd stop
/etc/init.d/mysqld stop
