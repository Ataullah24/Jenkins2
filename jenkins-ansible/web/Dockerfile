FROM remote-host

RUN mkdir -p /etc/apt/sources.list.d && \
    touch /etc/apt/sources.list.d/nginx.list

COPY ./conf/nginx.repo /etc/apt/sources.list.d/nginx.list

RUN wget http://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key && \
    apt update

RUN apt remove nginx nginx-common nginx-full nginx-core && \
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

RUN apt install nginx && \
    nginx -t && \
    nginx -v && \
    /lib/systemd/systemd-sysv-install enable nginx && \
    service nginx start && \
    service nginx status

RUN  apt install -y php-fpm && \
     service  php7.2-fpm start && \
     service  php7.2-fpm status && \
     apt install -y php7.2-cli && \
     apt install -y php7.2-mysql && \
     apt install -y php7.2-soap && \
     apt install -y php7.2-xml && \
     apt install -y php7.2-zip && \
     apt install -y php7.2-json && \
     apt install -y php7.2-mbstring && \
     apt install -y php7.2-gd && \
