FROM jenkins/jenkins:latest-jdk21

USER root
COPY --from=stackexchange/dnscontrol /usr/local/bin/dnscontrol /usr/local/bin/
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/
RUN apt-get update && apt-get install -y docker wget bash openssh-client

USER jenkins
