FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
EXPOSE 80/tcp

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ./src .
RUN dotnet restore -nowarn:msb3202,nu1503 -p:RestoreUseSkipNonexistentTargets=false
RUN dotnet publish --no-restore -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "integration_with_docker.dll"]