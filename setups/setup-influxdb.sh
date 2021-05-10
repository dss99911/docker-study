INFLUX_PATH=$(PWD)/influxdb
INFLUX_VERSION=2.0.6
docker run \
  --rm influxdb:"$INFLUX_VERSION" \
  influxd print-config > "$INFLUX_PATH"/config.yml

docker run -d \
    --name influxdb \
    --restart unless-stopped \
    -p 8086:8086 \
    -v "$INFLUX_PATH"/.data:/var/lib/influxdb2 \
    -v "$INFLUX_PATH"/config.yml:/etc/influxdb2/config.yml \
    influxdb:"$INFLUX_VERSION" \
    --reporting-disabled