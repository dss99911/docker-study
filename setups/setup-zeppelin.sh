docker run -d \
  --restart unless-stopped \
  -p 8890:8080 \
  --name zeppelin apache/zeppelin:0.9.0