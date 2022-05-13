FROM mcr.microsoft.com/dotnet/sdk:3.1
RUN rm -r build
RUN mkdir /build
RUN echo 'Dockerfile running 🍉'

RUN git clone https://github.com/Klatix/NumberGuesserOOP.git
WORKDIR NumberGuesserOOP/BasicNumberGuesser
RUN dotnet build --output build

VOLUME /build
