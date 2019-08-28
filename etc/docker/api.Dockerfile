# should match cloud.gov manifest GOVERSION
FROM golang:1.12

# install dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# install golint
RUN go get -u golang.org/x/lint/golint

# set working directory
WORKDIR /go/src/github.com/18F/hello-ampd/src

# add project binaries to list of executable directories
ENV PATH="${PATH}:${GOPATH}/src/github.com/18F/hello-ampd/bin
