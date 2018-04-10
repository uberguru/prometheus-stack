docker-compose down 
docker image rm monitoring_grafana
docker image rm monitoring_blackbox
docker volume rm monitoring_prometheus
docker-compose up --rebuild --force-recreate
