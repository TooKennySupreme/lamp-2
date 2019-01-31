FROM amazonlinux:2018.03

RUN yum update -y && yum install -y \
sudo \
httpd24 \
mod24_ssl \
php71 \
php71-bcmath \
php71-cli \
php71-common \
php71-devel \
php71-gd \
php71-json \
php71-json-devel \
php71-mbstring \
php71-mysqlnd \
php71-pdo \
php71-pecl-ssh2 \
php71-process \
php71-tidy \
php71-xml \
mysql \
mysql57-server \
nano \
less \
openssh-server \
openssh-clients \
rsync \
which \
&& yum clean all

EXPOSE 80
EXPOSE 443
EXPOSE 3306

ADD create-user.sh /tmp/create-user.sh
ADD create-cert.sh /tmp/create-cert.sh
ADD server-config.sh /tmp/server-config.sh
ADD start-servers.sh /usr/sbin/start-servers
ADD set-permissions.sh /tmp/set-permissions.sh

RUN /bin/bash /tmp/create-user.sh && \
rm /tmp/create-user.sh && \
/bin/bash /tmp/create-cert.sh && \
rm /tmp/create-cert.sh && \
/bin/bash /tmp/server-config.sh && \
rm /tmp/server-config.sh

ADD .ssh /home/ec2-user/.ssh

RUN /bin/bash /tmp/set-permissions.sh && \
rm /tmp/set-permissions.sh

CMD /usr/bin/env bash start-servers;sleep infinity
