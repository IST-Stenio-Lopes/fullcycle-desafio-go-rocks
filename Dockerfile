FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN go build -o bin .

FROM scratch

COPY --from=builder /app/bin /app/bin

ENTRYPOINT [ "./app/bin" ]