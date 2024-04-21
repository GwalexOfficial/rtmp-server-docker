FROM debian:stable-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev wget git zlib1g-dev bash unattended-upgrades && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean

RUN wget 'https://nginx.org/download/nginx-1.24.0.tar.gz' \
    && tar -zxvf nginx-1.24.0.tar.gz \
    && git clone https://github.com/arut/nginx-rtmp-module.git \
    && cd nginx-1.24.0 \
    && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module \
    && make \
    && make install

RUN wget -O /usr/local/nginx/conf/nginx.conf https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/nginx/conf/nginx.conf \
    && wget -O /usr/local/nginx/html/stat.xsl https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/nginx/html/stat.xsl

EXPOSE 1935
EXPOSE 8090

RUN echo 'APT::Periodic::Update-Package-Lists "1";' >> /etc/apt/apt.conf.d/20auto-upgrades && \
    echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades && \
	echo 'APT::Periodic::AutocleanInterval "7";' >> /etc/apt/apt.conf.d/20auto-upgrades && \
    echo 'Unattended-Upgrade::Remove-Unused-Dependencies "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades && \
    echo 'Unattended-Upgrade::Automatic-Reboot "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades && \
    echo 'Unattended-Upgrade::Automatic-Reboot-Time "02:00";' >> /etc/apt/apt.conf.d/50unattended-upgrades

CMD unattended-upgrades & /usr/local/nginx/sbin/nginx -g "daemon off;"
