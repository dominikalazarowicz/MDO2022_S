FROM dotnet_deps:latest
VOLUME /build
RUN echo 'Dockerfile running 🍉'

RUN pwd
ENTRYPOINT ["dotnet", "BasicNumberGuesser.dll"]
RUN cd build ; dotnet run
