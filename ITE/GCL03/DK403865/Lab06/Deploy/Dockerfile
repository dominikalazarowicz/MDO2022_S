FROM mcr.microsoft.com/dotnet/runtime:3.1
VOLUME /build
RUN echo 'Dockerfile running 🍉'

RUN pwd
ENTRYPOINT ["dotnet", "build/BasicNumberGuesser.dll"]
RUN cd build ; dotnet run
