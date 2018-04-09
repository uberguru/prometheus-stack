FROM centos:7

#Install dependencies
RUN yum -y update && yum -y install wget

#Create a prometheus user
RUN useradd -ms /bin/bash prometheus

#Download the binary
RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.1/alertmanager-0.15.0-rc.1.linux-amd64.tar.gz

#install to folder
RUN tar -xvzf alertmanager-0.15.0-rc.1.linux-amd64.tar.gz -C /opt/ && rm alertmanager-0.15.0-rc.1.linux-amd64.tar.gz && mv /opt/alertmanager-0.15.0-rc.1.linux-amd64 /opt/alertmanager

#add your configuration
ADD config.yml /opt/alertmanager/config.yml 

#change permissions
USER root
RUN chown prometheus:prometheus -R /opt/alertmanager
RUN mkdir -p /alertmanager && chown prometheus:prometheus -R /alertmanager

USER       prometheus
EXPOSE     9093
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/opt/alertmanager/alertmanager" ]
CMD        [ "--config.file=/opt/alertmanager/config.yml", \
             "--storage.path=/alertmanager" ]
