FROM deployer:latest

RUN mkdir -p mle/DEBIAN
RUN mkdir -p mle/usr/bin

RUN echo "Package:mle\n\
Version: 0.2 \n\
Maintainer: Piotr \n\
Architecture: all \n\
Description: mle package \n\
Depends: uthash-dev, liblua5.3-dev, libpcre3-dev" > mle/DEBIAN/control

CMD ["/bin/bash", "-c",  "cp /publish/mle mle/usr/bin/mle && dpkg-deb --build mle && cp mle.deb /publish"]
