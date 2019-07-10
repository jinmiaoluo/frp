export PATH := $(GOPATH)/bin:$(PATH)

all: fmt build

build: frps frpc

# compile assets into binary file
file:
	rm -rf ./assets/frps/static/*
	rm -rf ./assets/frpc/static/*
	cp -rf ./web/frps/dist/* ./assets/frps/static
	cp -rf ./web/frpc/dist/* ./assets/frpc/static
	rm -rf ./assets/frps/statik
	rm -rf ./assets/frpc/statik
	go generate ./assets/...

fmt:
	go fmt ./...

frps: frps_linux_arm frps_linux_arm64 frps_linux_amd64

frps_linux_arm:
	GOOS=linux GOARCH=arm go build -o bin/frps_linux_arm ./cmd/frps

frps_linux_arm64:
	GOOS=linux GOARCH=arm64 go build -o bin/frps_linux_arm64 ./cmd/frps

frps_linux_amd64:
	GOOS=linux GOARCH=amd64 go build -o bin/frps_linux_amd64 ./cmd/frps

frpc: frpc_linux_arm frpc_linux_arm64 frpc_linux_amd64

frpc_linux_arm:
	GOOS=linux GOARCH=arm go build -o bin/frpc_linux_arm ./cmd/frpc

frpc_linux_arm64:
	GOOS=linux GOARCH=arm64 go build -o bin/frpc_linux_arm64 ./cmd/frpc

frpc_linux_amd64:
	GOOS=linux GOARCH=amd64 go build -o bin/frpc_linux_amd64 ./cmd/frpc

test: gotest

gotest:
	go test -v --cover ./assets/...
	go test -v --cover ./client/...
	go test -v --cover ./cmd/...
	go test -v --cover ./models/...
	go test -v --cover ./server/...
	go test -v --cover ./utils/...

ci:
	go test -count=1 -p=1 -v ./tests/...

alltest: gotest ci

clean:
	rm -f ./bin/frpc
	rm -f ./bin/frps
