FROM node

COPY /build/ /
WORKDIR /build/
RUN node cytoscape.min.js
