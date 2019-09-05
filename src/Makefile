#MAKEFLAGS += --silent

all: clean test build

test:
	GOLANG_ENV=test go test -coverprofile=coverage.txt -covermode=atomic -cover github.com/18F/hello-ampd/src

build:
	go build -o ../bin/hello-ampd

clean:
	rm -f ../bin/hello-ampd coverage.txt
