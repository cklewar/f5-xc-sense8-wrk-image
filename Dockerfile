FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    gcc libgcc libffi-dev alpine-sdk openssl-dev zlib-dev make git perl
RUN git clone https://github.com/wg/wrk wrk
RUN cd wrk && make && mv wrk /bin/
ENTRYPOINT ["wrk"]
