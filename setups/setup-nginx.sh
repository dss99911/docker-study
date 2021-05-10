#if doesn't create directory. docker create, and it's created by root permission
# todo use docker-compose and connect several service by compose
mkdir /home/ec2-user/static
mkdir /home/ec2-user/nginx
sudo docker run -d \
  --restart unless-stopped \
  -p 80:80 \
  -v /home/ec2-user/static:/usr/share/nginx/html:ro \
  -v /home/ec2-user/nginx:/etc/nginx/conf.d:ro \
  nginx

# if need to change nginx.conf as well
#sudo docker run -d \
#  --restart unless-stopped \
#  -p 80:80 \
#  -v /home/ec2-user/static:/usr/share/nginx/html:ro \
#  -v /home/ec2-user/nginx:/etc/nginx/conf.d:ro \
#  nginx

## if want to modify nginx.conf, copy nginx.conf file from image. and modify it.
## TODO run nginx -> copy nginx.conf to host server. remove container -> run nginx again.
##  -v /home/ec2-user/nginx.conf:/etc/nginx/nginx.conf:ro \