FROM golang:1.21-bookworm as builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .

RUN CGO_ENABLED=true go build -o main ./...

FROM debian:bookworm

WORKDIR /app

COPY --from=builder /app/main .
COPY public public
COPY templates templates

ENV PORT=3000 INSTANCE_NAME=HELLO INSTANCE_HASH=12515

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -sf http://localhost:${PORT}/healthz || exit 1

ENTRYPOINT [ "./main" ]