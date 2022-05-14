FROM mcr.microsoft.com/dotnet/sdk:3.1
RUN mkdir /build_artifacts
VOLUME /build_artifacts
RUN echo 'Dockerfile running 🍉'

RUN git clone https://github.com/Klatix/NumberGuesserOOP.git ; cd NumberGuesserOOP ; git pull origin
WORKDIR NumberGuesserOOP/BasicNumberGuesser
RUN dotnet build --output build_artifacts


