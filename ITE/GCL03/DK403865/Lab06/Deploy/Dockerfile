FROM mcr.microsoft.com/dotnet/runtime:3.1
VOLUME /build
RUN echo 'Dockerfile running 🍉'
WORKDIR /build
RUN pwd
ENTRYPOINT ["dotnet", "BasicNumberGuesser.dll"]
RUN dotnet run
