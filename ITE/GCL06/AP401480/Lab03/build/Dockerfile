FROM node:14

RUN git clone https://github.com/l2beat/l2beat.git
WORKDIR ./l2beat
RUN yarn

WORKDIR ./packages/common
RUN yarn build

WORKDIR ../config
RUN yarn build

WORKDIR ../backend
RUN yarn build:mock
