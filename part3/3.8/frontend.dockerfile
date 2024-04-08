FROM node:16 as build-stage

WORKDIR /usr/src/app
COPY . .

RUN npm install && \
    npm run build && \
    npm install -g serve

FROM node:16-alpine

WORKDIR /usr/src/app
EXPOSE 5000
COPY --from=build-stage /usr/src/app/build/ /usr/src/app/build/

RUN npm install -g serve && \
    adduser -D appuser && \
    chown appuser build

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
