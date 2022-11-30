FROM mcr.microsoft.com/dotnet/sdk:7.0.100-bullseye-slim-amd64

RUN apt update -y; \
    apt install --no-install-recommends -y ca-certificates curl gnupg lsb-release openssl libssl-dev libssl1.1; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg; \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null; \
    apt update -y && apt install docker-ce-cli --no-install-recommends -y; \
    rm -rf /var/lib/apt/lists/*
