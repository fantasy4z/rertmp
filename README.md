# rertmp
Relay (publish) RTMP stream to multiple RTMP servers, utilizing `nginx-rtmp-module`.

## Required
docker

## Setup
1. Modify `push` config in `nginx.conf`
2. `./docker.sh build`
3. `./docker.sh run`
4. Have a try. `ffmpeg -re -i ~/Videos/test.mp4 -c copy -f flv rtmp://localhost/app/livestream`
5. `./docker.sh stop` to stop and remove the docker container.
