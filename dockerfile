
# Authorization microservice
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as auth-image
WORKDIR /app
COPY ./build/auth .
ENTRYPOINT ["dotnet", "Stayin.Auth.dll"]

# Gateway
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as gateway-image
WORKDIR /app
COPY ./build/gateway .
ENTRYPOINT ["dotnet", "Stayin.Gateway.dll"]

# Storage
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as storage-image
WORKDIR /app
COPY ./build/storage .
ENTRYPOINT ["dotnet", "Stayin.Storage.dll"]


# Frontend server
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as frontend-image
WORKDIR /app
COPY ./build/static ./
COPY ./stayin-front/build ./wwwroot
ENTRYPOINT ["dotnet", "FileServer.dll"]



