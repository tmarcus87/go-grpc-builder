FROM golang:1.11-alpine3.8

RUN apk add --no-cache bash git curl openssh gcc g++ protobuf protobuf-dev \
    && go get -u github.com/golang/dep/cmd/dep \
    && go get -u google.golang.org/grpc \
    && go get -u github.com/golang/protobuf/protoc-gen-go \
    && go install github.com/golang/mock/mockgen

RUN mkdir ~/.ssh \
    && chmod 700 ~/.ssh \
    && echo "Host *" > ~/.ssh/config \
    && echo "  StrictHostKeyChecking  no" >> ~/.ssh/config \
    && echo "  UserKnownHostsFile     /dev/null" >> ~/.ssh/config \
    && chmod 644 ~/.ssh/config
