
FROM build-agent

WORKDIR /app

CMD apt update; apt upgrade -y; \
    bash /test/waiter.sh; \
     cd ./wire-desktop; \
     yarn; \ 
     yarn fix:other; \ 
     yarn test:types && yarn lint && yarn prestart && yarn build:ts:tests && yarn test:react && yarn test:bin && yarn clear:coverage;

FROM node:lts
WORKDIR /app

RUN apt update -y
CMD ./wire-desktop
CMD yarn
CMD yarn fix:other
CMD yarn test:types && yarn lint && yarn prestart && yarn build:ts:tests && yarn test:react && yarn test:bin && yarn clear:coverage

