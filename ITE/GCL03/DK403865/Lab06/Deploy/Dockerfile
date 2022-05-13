FROM dotnet_deps:latest
VOLUME /build
RUN echo 'Dockerfile running 🍉'
WORKDIR /build
RUN pwd
ENTRYPOINT ["dotnet", "BasicNumberGuesser.dll"]
RUN ls ; dotnet run
