FROM golang:1.10-alpine

RUN apk add --update tzdata \
    bash wget curl git;

RUN mkdir -p $$GOPATH/bin && \
    go get github.com/golang/dep/cmd/dep && \
    go get github.com/codegangsta/gin

WORKDIR /go/src/app
CMD /bin/sh

## live reloading usage:
##   $ docker build -t go-docker-dev .
##   $ docker run --rm -it -p 8080:8080 -v $(pwd):/go/src/app go-docker-dev bash
##
##   root@id:/go/src/app# gin --path src --port 8080 run main.go
