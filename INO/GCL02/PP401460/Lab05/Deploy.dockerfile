FROM ubuntu:latest

RUN apt update && apt-get install -y uthash-dev liblua5.3-dev libpcre3-dev

CMD ["/bin/bash", "-c",  "cp /build/mle usr/bin && mle"]