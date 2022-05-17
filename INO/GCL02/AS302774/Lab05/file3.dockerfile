FROM node

COPY /build/ .
WORKDIR /build/
RUN ls -la
RUN pwd
RUN node cytoscape.min.js
