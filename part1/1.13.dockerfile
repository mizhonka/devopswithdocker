FROM golang:1.16

WORKDIR /usr/src/app
EXPOSE 8080
COPY . .

RUN go build

CMD ["./server"]
# docker run -p 127.0.0.1:8080:8080 example-backend
