FROM resin/rpi-raspbian

MAINTAINER bchalk

RUN apt-get update
RUN apt-get install -y \
      curl gcc libc6-dev libc6 git wget

ENV GO_VERSION 1.8
ENV OS linux
ENV ARCH armv6l

RUN wget https://dl.google.com/go/go$GO_VERSION.$OS-$ARCH.tar.gz &&\
    tar -C /usr/local -xzf go$GO_VERSION.$OS-$ARCH.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
