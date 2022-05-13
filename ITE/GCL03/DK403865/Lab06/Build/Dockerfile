FROM mcr.microsoft.com/dotnet/sdk:3.1
RUN mkdir /build
RUN echo 'Dockerfile running 🍉'

RUN git clone https://github.com/Klatix/NumberGuesserOOP.git ; cd NumberGuesserOOP ; git pull origin
WORKDIR NumberGuesserOOP/BasicNumberGuesser
RUN dotnet build --force --configuration Release --output build

VOLUME /build
