FROM dotnet_deps:latest
VOLUME /build
RUN echo 'Dockerfile running 🍉'

RUN pwd
RUN ls -a
RUN cd build ; dotnet run
RUN ls -a