#!/usr/bin/env bash

CERT_DIR=/etc/pki/tls/certs/
CERT_PRI_DIR=/etc/pki/tls/private/
HTTPD_SSL_CONF=/etc/httpd/conf.d/ssl.conf
SUBJECT='/C=US/ST=MA/L=Boston/O=Acme/OU=IT/CN=localhost'

openssl req -new -key ${CERT_PRI_DIR}localhost.key -out ${CERT_DIR}localhost.csr -subj $SUBJECT
openssl x509 -req -days 365 -in ${CERT_DIR}localhost.csr -signkey ${CERT_PRI_DIR}localhost.key -out ${CERT_DIR}localhost.crt

chmod 600 ${CERT_PRI_DIR}localhost.key ${CERT_DIR}localhost.csr ${CERT_DIR}localhost.crt
