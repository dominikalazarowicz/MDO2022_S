FROM builder:latest

RUN tar cfJ archive.tar.xz build
RUN cp archive.tar.xz /finalArchive
