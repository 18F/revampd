#MAKEFLAGS += --silent

all: clean test build

test:
	GOLANG_ENV=test go test

build:
	go build -o ../bin/hello-ampd

clean:
	rm -f ../bin/hello-ampd
