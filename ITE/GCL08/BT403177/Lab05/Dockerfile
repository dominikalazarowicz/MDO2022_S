FROM node:alpine

WORKDIR cropper_test

RUN apk update && apk add bash 
    &&  apk upgrade --no-cache --available \
    &&  apk add --no-cache \ 
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
      chromium \
    && apk add --no-cache \
      ttf-freefont \
      font-noto-emoji \
    && apk add --no-cache \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
      wqy-zenhei
