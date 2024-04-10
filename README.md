# RTMP-Server for Docker

Build Image
docker build -t rtmp-server .

Run Container 
docker run -d --name RTMP-Server --restart unless-stopped -p 8080:80 -p 1935:1935 rtmp-server
