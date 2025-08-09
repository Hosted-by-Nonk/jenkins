FROM golang:1.24 AS builder
RUN go install github.com/StackExchange/dnscontrol/v4@main

FROM jenkins/jenkins:latest-jdk21

USER root
RUN apt-get update && apt-get install -y docker wget bash openssh-client
COPY --from=builder /go/bin/dnscontrol /usr/local/bin/

USER jenkins
