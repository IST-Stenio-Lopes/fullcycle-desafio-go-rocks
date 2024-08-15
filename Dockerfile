FROM golang:1.21.0-alpine3.17 as builder

ENV CGO_ENABLED=0
ENV GOOS=linux

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build -o bin .

FROM scratch

COPY --from=builder /app/bin /app/bin

ENTRYPOINT [ "./app/bin" ]
