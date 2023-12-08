#FROM golang:1.19.3-alpine3.17 AS builder
FROM golang:alpine AS builder
RUN apk add --no-cache git
#FROM golang:1.17-alpine AS builder
# ENV GO111MODULE=ON \
#     CGO_ENABLE=0 \
#     GOOS=LINUX \
#     GOARCH=amd64
WORKDIR /web
COPY . /web
#RUN chmod +x dispatcher.go
RUN go mod init web
RUN go mod download
COPY . .
RUN go install
RUN go build -o web -v .
#RUN go build dispatcher.go
#CMD [ "./web-go" ]
#ENTRYPOINT [ "./web-go" ]

FROM alpine
#FROM alpine:3.17
RUN apk update
#RUN apk --no-cache add ca-certificates
#FROM scratch
WORKDIR /web
COPY --from=builder /web .
ENTRYPOINT [ "./web" ]
#ENTRYPOINT ["dispatcher.go"]
EXPOSE 80




