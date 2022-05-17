FROM node

RUN ls -la
RUN pwd

COPY /build .

RUN ls -la
RUN pwd

WORKDIR /build/

RUN ls -la
RUN pwd

RUN node cytoscape.min.js
