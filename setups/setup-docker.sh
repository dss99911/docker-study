sudo yum update -y
sudo yum install docker -y
sudo service docker start
# sudo systemctl enable docker.service #todo 이거 필요한지?
# TODO consider allow ec2-user to use docker without sudo