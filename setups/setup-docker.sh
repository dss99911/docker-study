# https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

# sudo systemctl enable docker.service #todo 이거 필요한지?
# TODO consider allow ec2-user to use docker without sudo