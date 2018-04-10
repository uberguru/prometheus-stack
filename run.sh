docker-compose down 
docker-compose down 
docker volume rm monitoring_prometheus
docker-compose up --force-recreate --build
