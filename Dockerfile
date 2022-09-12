FROM ruby:3.1.0-alpine3.15

RUN apk update && \
    apk upgrade && \
    apk add bash

COPY entrypoint.sh /entrypoint.sh
COPY send_message.rb /send_message.rb

ENTRYPOINT ["/entrypoint.sh"]
