FROM node

COPY /build/ /
WORKDIR /build/
RUN ls -la
RUN node cytoscape.min.js
