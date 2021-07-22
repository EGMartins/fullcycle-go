FROM golang:1.14.3-alpine AS builder
WORKDIR /go/src
COPY main.go .
RUN go build main.go
FROM scratch
COPY --from=builder /go/src /
ENTRYPOINT ["./main"]
