FROM ptrk00/mle_rt

RUN apt update && apt-get install -y uthash-dev liblua5.3-dev libpcre3-dev

ENTRYPOINT ["/bin/bash", "-c",  "cp /build/mle usr/bin && mle"]