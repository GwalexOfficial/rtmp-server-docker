# RTMP-Server for Docker

For amd64 systems: docker run -d --name rtmp-server --restart always -p 8090:80 -p 1935:1935 gwalexofficial/rtmp-server:latest

For arm64 systems: docker run -d --name rtmp-server --restart always -p 8090:80 -p 1935:1935 gwalexofficial/rtmp-server:latest-arm64

Since v4.0 it use Alpine instead of Debian for better performance 

## Build Docker Image self:

wget https://raw.githubusercontent.com/GwalexOfficial/rtmp-server-docker/main/Dockerfile

Build Image: docker build --no-cache -t rtmp-server .

Run Container: docker run -d --name rtmp-server --restart always -p 8090:80 -p 1935:1935 rtmp-server

## Usage:

Stream-URL: rtmp://ip:1935/publish/{live}

Watch-URL: rtmp://ip:1935/publish/{live}

{live} ist your streamkey, that can be anything

Docker Hub: https://hub.docker.com/r/gwalexofficial/rtmp-server
