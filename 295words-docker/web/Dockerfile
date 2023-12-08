FROM golang:1.17-alpine AS builder
# ENV GO111MODULE=ON \
#     CGO_ENABLE=0 \
#     GOOS=LINUX \
#     GOARCH=amd64
WORKDIR /web-go
COPY . /web-go
RUN go mod init web
RUN go mod download
COPY . .
RUN go install
RUN go build dispatcher.go

FROM scratch
COPY --from=builder /web-go .
ENTRYPOINT [ "./dispatcher" ]



