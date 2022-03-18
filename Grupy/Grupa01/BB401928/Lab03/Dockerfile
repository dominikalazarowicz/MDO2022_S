FROM ubuntu:latest
WORKDIR app
COPY /home/suvres/.ssh/id_rsa_rp .
RUN apk update; apk upgrade \
    apk install git; \
    eval "$(ssh-agent -s)"; \
    ssh-add ./id_rsa_rp;

