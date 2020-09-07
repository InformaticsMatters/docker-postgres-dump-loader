FROM alpine:3.12.0

RUN apk add \
        zip \
        postgresql-client=12.4-r0

WORKDIR /dumps
COPY dumps/*.zip ./

ENTRYPOINT ["/usr/bin/env"]
