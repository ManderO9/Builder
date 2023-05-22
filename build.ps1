# Delete old build
rmdir -r .\build

# Publish authorization microservice
dotnet publish --os linux -c Release -o .\build\auth .\Stayin.Auth\Stayin.Auth.csproj

# Publish gateway
dotnet publish --os linux -c Release -o .\build\gateway .\Stayin.Gateway\Stayin.Gateway.csproj

# Publish storage app
dotnet publish --os linux -c Release -o .\build\storage .\Stayin.Storage\Stayin.Storage.csproj

# Publish static server for serving frontend
dotnet publish --os linux -c Release -o .\build\static .\StaticServer\FileServer.csproj

# Publish frontend
cd .\stayin-front
npm run build
cd ..

# Delete old images
docker rmi image-frontend
docker rmi image-storage
docker rmi image-auth
docker rmi image-gateway

# Run docker compose
docker-compose up -d