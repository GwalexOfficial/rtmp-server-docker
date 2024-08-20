FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base pcre pcre-dev openssl openssl-dev wget git zlib-dev

RUN wget 'https://nginx.org/download/nginx-1.26.2.tar.gz' \
    && tar -zxvf nginx-1.26.2.tar.gz \
    && git clone https://github.com/arut/nginx-rtmp-module.git \
    && cd nginx-1.26.2 \
    && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module \
    && make \
    && make install

RUN wget -O /usr/local/nginx/conf/nginx.conf https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/nginx/conf/nginx.conf \
    && wget -O /usr/local/nginx/html/stat.xsl https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/nginx/html/stat.xsl

RUN apk del build-base wget git && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /nginx-1.26.2.tar.gz /nginx-1.26.2 /nginx-rtmp-module

CMD /usr/local/nginx/sbin/nginx -g "daemon off;"
