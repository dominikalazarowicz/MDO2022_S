FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN echo 'Dockerfile pulling repo to volume 🍉'

RUN git clone https://github.com/Klatix/NumberGuesserOOP.git
WORKDIR NumberGuesserOOP/BasicNumberGuesser
RUN pwd
RUN dotnet build --output predeoploy_data/
