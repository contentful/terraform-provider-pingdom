FROM golang:1.26-alpine@sha256:0178a641fbb4858c5f1b48e34bdaabe0350a330a1b1149aabd498d0699ff5fb2
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -mod vendor
