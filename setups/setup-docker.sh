sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker.service
# sudo systemctl enable docker.service #todo 이거 필요한지? test server에서는 호출 안함. 잘 작동하면 없어도 될 듯
# TODO consider allow ec2-user to use docker without sudo