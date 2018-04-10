FROM centos:7 

RUN yum -y update && yum -y install wget 

RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.0.4.linux-x64.tar.gz

RUN tar -xvzf grafana-5.0.4.linux-x64.tar.gz -C /opt/ && rm grafana-5.0.4.linux-x64.tar.gz  && mv /opt/grafana-5.0.4 /opt/grafana

RUN useradd -ms /bin/bash grafana

#add custom config to overide conf/defaults.ini
ADD custom.ini /opt/grafana/custom.ini
ADD ./provisioning /opt/grafana/conf/provisioning
ADD ./dashboards /opt/grafana/dashboards


RUN chown -R grafana: /opt/grafana

WORKDIR     /opt/grafana
USER        grafana
EXPOSE      9003
#VOLUME      [ "/grafana-data" ]
ENTRYPOINT  [ "./bin/grafana-server" ]
CMD         [ "web" ]
