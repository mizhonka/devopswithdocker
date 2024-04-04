FROM ubuntu:22.04

WORKDIR /usr/src/app
EXPOSE 5000
COPY . .

RUN apt-get update && apt-get install -y curl python3 && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    apt install -y nodejs && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    useradd -m appuser && \
    chown appuser . && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
