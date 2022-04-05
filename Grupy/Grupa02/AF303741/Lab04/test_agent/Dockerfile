FROM node:lts
WORKDIR /app

RUN apt update -y
CMD ./wire-desktop
CMD yarn
CMD yarn fix:other
CMD yarn test:types && yarn lint && yarn prestart && yarn build:ts:tests && yarn test:react && yarn test:bin && yarn clear:coverage
