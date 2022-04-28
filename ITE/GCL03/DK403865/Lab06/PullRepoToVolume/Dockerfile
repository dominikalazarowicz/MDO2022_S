FROM mcr.microsoft.com/dotnet/sdk:3.1
VOLUME 
RUN echo 'Dockerfile pulling repo to volume 🍉'
CMD pwd
RUN pwd ; git clone https://github.com/Klatix/NumberGuesserOOP.git
WORKDIR NumberGuesserOOP/BasicNumberGuesser
RUN dotnet build --output predeoploy_data/
