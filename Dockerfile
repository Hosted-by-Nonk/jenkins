FROM jenkins/jenkins:latest-jdk21

USER root
RUN apt-get update && apt-get install -y docker go

USER jenkins
RUN github.com/StackExchange/dnscontrol/v4@main
