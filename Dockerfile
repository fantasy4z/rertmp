FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y \
      wget \
      unzip \
      build-essential \
      libpcre3 \
      libpcre3-dev \
      libssl-dev

RUN cd /root \
  && wget http://nginx.org/download/nginx-1.11.4.tar.gz \
  && wget https://github.com/arut/nginx-rtmp-module/archive/master.zip \
  && tar -zxvf nginx-1.11.4.tar.gz \
  && unzip master.zip \
  && cd nginx-1.11.4 \
  && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master \
  && make \
  && make install

RUN mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.bak

WORKDIR /rertmp

CMD cp -f ./nginx.conf /usr/local/nginx/conf/nginx.conf \
  && /usr/local/nginx/sbin/nginx -g 'daemon off;'
