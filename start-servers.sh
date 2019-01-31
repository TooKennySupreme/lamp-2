#!/usr/bin/env bash

service httpd stop

if [ -e /var/run/httpd/httpd.pid ]
then
	rm -f /var/run/httpd/httpd.pid
fi

service httpd start

service mysqld stop

if [ -e /var/run/mysqld/mysqld.pid ]
then
    rm -f /var/run/mysqld/mysqld.pid
fi

if [ -e /var/lib/mysql/mysql.sock ]
then
    rm -f /var/lib/mysql/mysql.sock
fi

service mysqld start

service sshd stop

if [ -e /var/run/sshd.pid ]
then
	rm -f /var/run/sshd.pid
fi

service sshd start
