FROM ubuntu:22.04

WORKDIR /usr/src/app
EXPOSE 5000
COPY . .

RUN apt-get update && apt-get install -y curl python3
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install -y nodejs
RUN npm install
RUN npm install -g serve

CMD ["serve", "-s", "-l", "5000", "build"]
