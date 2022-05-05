FROM builder:latest

RUN tar cfJ archive.tar.xz build
RUN mv -n archive.tar.xz /finalArchive
