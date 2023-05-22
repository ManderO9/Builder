# Install dotnet if you don't have it
# Install node if you don't have it
# Run docker 

# Create a directory
mkdir project
cd project

# Copy dockerfile, docker-compose and build.ps1 to the current directory (project)
cp ../dockerfile .
cp ../docker-compose.yaml .
cp ../build.ps1 .

# Clone all repositories
git clone https://github.com/ManderO9/StaticServer
git clone https://github.com/ManderO9/Stayin.Auth
git clone https://github.com/ManderO9/Stayin.Storage
git clone https://github.com/ManderO9/Stayin.Gateway
git clone https://github.com/chachouaamani/stayin-front


# Install npm packages
cd stayin-front
npm install
cd .. 

# Run build
.\build.ps1
