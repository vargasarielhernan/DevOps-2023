FROM golang:alpine AS builder
RUN apt-get update
ENV GO111MODULE=ON \
    CGO_ENABLE=0 \
    GOOS=LINUX \
    GOARCH=amd64
WORKDIR /go/src
COPY go.mod .
RUN go mod download
COPY . .
RUN go build main.go

FROM scratch
COPY --from=builder /go/src .
ENTRYPOINT [ "./main" ]



