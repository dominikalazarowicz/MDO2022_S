FROM ubuntu:latest
WORKDIR app

RUN apt update && apt install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*
