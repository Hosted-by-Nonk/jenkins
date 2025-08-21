FROM golang:1.24 AS builder
RUN go install github.com/StackExchange/dnscontrol/v4@main

FROM jenkins/jenkins:latest-jdk21

USER root
COPY --from=builder /go/bin/dnscontrol /usr/local/bin/
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/
RUN apt-get update && apt-get install -y docker wget bash openssh-client

USER jenkins
