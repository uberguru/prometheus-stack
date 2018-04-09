FROM centos:7

RUN yum -y update && yum -y install wget

ENV PROM_VERSION 2.2.1


#Create a prometheus user
RUN useradd -ms /bin/bash prometheus

#Download the prometheus binary
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-$PROM_VERSION.linux-amd64.tar.gz


#install to folder
RUN tar -xvzf prometheus-$PROM_VERSION.linux-amd64.tar.gz -C /opt/ && rm prometheus-$PROM_VERSION.linux-amd64.tar.gz && mv /opt/prometheus-$PROM_VERSION.linux-amd64 /opt/prometheus


#Add your configuration
ADD prometheus.yml /opt/prometheus/prometheus.yml

#change permissions
USER root
RUN chown prometheus:prometheus -R /opt/prometheus
RUN mkdir -p /prometheus && chown prometheus:prometheus -R /prometheus


#Execution stuff
USER       prometheus
EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/opt/prometheus/prometheus" ]
CMD        [ "--config.file=/opt/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/opt/prometheus/console_libraries", \
             "--web.console.templates=/opt/prometheus/consoles" ]




