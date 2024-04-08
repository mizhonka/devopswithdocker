FROM golang:1.16 as build-stage

WORKDIR /usr/src/app
COPY . .
ENV CGO_ENABLED=0

RUN go build && \
    useradd -m appuser && \
    chown appuser server

FROM scratch

WORKDIR /usr/src/app
EXPOSE 8080

COPY --from=build-stage /usr/src/app/server /usr/src/app/
COPY --from=build-stage /etc/passwd /etc/passwd

USER appuser

CMD ["./server"]
