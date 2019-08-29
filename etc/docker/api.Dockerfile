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

# COPY source paths are relative to the build context on the host OS
# and requires a trailing slash on a destination directory under WORKDIR
COPY src/Gopkg.toml src/Gopkg.lock ./

# install dependencies under WORKDIR, in `vendor`
RUN dep ensure -vendor-only
