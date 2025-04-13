FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y docker.io sudo && \
    apt-get clean

RUN usermod -aG docker jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins

