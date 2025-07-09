FROM ubuntu:24.04 AS builder

RUN apt-get update && apt-get install -y wget
RUN cd /usr/local && wget -O go.tar.gz https://go.dev/dl/go1.24.5.linux-amd64.tar.gz && tar -xf go.tar.gz && rm go.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
RUN go install github.com/StackExchange/dnscontrol/v4@main

FROM jenkins/jenkins:latest-jdk21

USER root
RUN apt-get update && apt-get install -y docker wget bash openssh-client
COPY --from=builder /root/go/bin/dnscontrol /usr/local/bin/

USER jenkins
