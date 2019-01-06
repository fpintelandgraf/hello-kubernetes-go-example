FROM golang:1.8-alpine
ADD . /go/src/go-kubernetes
RUN go install go-kubernetes

FROM alpine:latest
COPY --from=0 /go/bin/go-kubernetes .
ENV PORT 8080
CMD ["./go-kubernetes"]
