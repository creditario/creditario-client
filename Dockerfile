FROM ruby:2.5.3-alpine3.9
RUN apk update && apk upgrade && \
    apk add --no-cache git build-base
