FROM alpine:3.12.0

RUN apk add \
        gnupg \
        postgresql-client=12.3-r2

WORKDIR /dumps
COPY dumps/*.gpg ./

ENTRYPOINT ["/usr/bin/env"]
