FROM golang:alpine AS builder
WORKDIR /app
RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/RM-Terrell/cibo.git .
RUN go mod download -x
RUN CGO_ENABLED=0 GOOS=linux go build -o cibo ./cmd 

FROM alpine:latest
LABEL org.opencontainers.image.description="Stock fundamentals analysis in Go"
WORKDIR /app
COPY --from=builder /app/cibo .
CMD ["./cibo"]