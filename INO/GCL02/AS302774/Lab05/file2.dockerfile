FROM image:latest

WORKDIR /cytoscape.js
RUN npm run test
