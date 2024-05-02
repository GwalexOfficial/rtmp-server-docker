# RTMP-Server for Docker

For amd64 systems: docker run -d --name rtmp-server --restart unless-stopped -p 8181:8181/tcp -p 8282:8282/udp gwalexofficial/rtmp-server:v1-amd64

For arm64 systems: docker run -d --name rtmp-server --restart unless-stopped -p 8181:8181/tcp -p 8282:8282/udp gwalexofficial/rtmp-server:v1-arm64
Build Docker Image self:

wget https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/Dockerfile

Build Image: docker build --no-cache -t rtmp-server .

Run Container: docker run -d --name rtmp-server --restart unless-stopped -p 8181:8181/tcp -p 8282:8282/udp rtmp-server
