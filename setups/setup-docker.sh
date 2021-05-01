sudo yum update -y
sudo yum install docker -y
sudo service docker start
systemctl enable docker.service
# TODO consider allow ec2-user to use docker without sudo