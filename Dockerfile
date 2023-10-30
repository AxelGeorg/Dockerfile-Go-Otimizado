FROM golang:1.21.3-alpine AS builder
WORKDIR /src
COPY main.go .

RUN go mod init main && \
    go build -o appgo main.go

FROM scratch
WORKDIR /app
COPY --from=builder /src/ .
CMD ["./appgo"]
