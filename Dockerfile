FROM alpine:3.9

WORKDIR /app

RUN apk update && apk upgrade && apk add npm nodejs jq

ENV NODE_ENV production

COPY package*.json /app/
RUN npm ci

COPY . /app/

CMD ./bin/start $(jq -c . < config.json)
