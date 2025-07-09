FROM jenkins/jenkins:latest-jdk21

USER root
RUN apt-get update && apt-get install -y docker wget

RUN cd /usr/local && wget -O go.tar.gz https://go.dev/dl/go1.24.5.linux-amd64.tar.gz && tar -xf go.tar.gz && rm go.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

RUN go install github.com/StackExchange/dnscontrol/v4@main

USER jenkins
