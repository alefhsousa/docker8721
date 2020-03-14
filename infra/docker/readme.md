# Comando para subir o prometheus
docker run -p 9090:9090 -v ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus


# Comando para subir o grafana

docker run -d -p 3000:3000 grafana/grafana

