FROM golang:1.15 AS builder
WORKDIR /src
COPY ./go.* ./
RUN go mod download
COPY . .
RUN go build -o /app .

FROM scratch
COPY --from=builder /app /app
EXPOSE 80
ENTRYPOINT ["/app"]