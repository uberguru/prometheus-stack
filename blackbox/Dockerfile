FROM centos:7

#Install dependencies
RUN yum -y update && yum -y install wget

#Create a prometheus user
RUN useradd -ms /bin/bash prometheus

#Download the binary
RUN wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.12.0/blackbox_exporter-0.12.0.linux-amd64.tar.gz

#install to folder
RUN tar -xvzf blackbox_exporter-0.12.0.linux-amd64.tar.gz -C /opt/ && rm blackbox_exporter-0.12.0.linux-amd64.tar.gz && mv /opt/blackbox_exporter-0.12.0.linux-amd64 /opt/blackbox

#add your configuration
ADD config.yml /opt/blackbox/config.yml 

#change permissions
USER root
RUN chown prometheus:prometheus -R /opt/blackbox
RUN mkdir -p /blackbox && chown prometheus:prometheus -R /blackbox

USER       prometheus
EXPOSE      9115
ENTRYPOINT  [ "/opt/blackbox/blackbox_exporter" ]
CMD         [ "--config.file=/opt/blackbox/config.yml" ]
