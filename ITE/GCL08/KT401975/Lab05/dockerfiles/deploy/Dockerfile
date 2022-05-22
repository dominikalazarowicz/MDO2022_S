FROM runner:latest
VOLUME /vol
WORKDIR /vol
RUN pwd
ENTRYPOINT ["dotnet", "dotnet-core-xunit-example.dll"]
RUN ls ; dotnet run