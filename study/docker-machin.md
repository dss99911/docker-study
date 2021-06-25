# Docker Machine

## Reference
- https://docs.docker.com/machine/
- [Install](https://docs.docker.com/machine/install-machine/)
- [Provision](https://docs.docker.com/machine/get-started-cloud/)

## Summary
- Remote Docker hosts에 접속해서, 배포, 실행 등의 docker 명령어를 수행
- outdated 된 듯. http://docs.docker.oeynet.com/machine/get-started-cloud/


## Install
- Mac
```
brew install docker-machine
```

## Command

### Create Env
- http://docs.docker.oeynet.com/machine/get-started-cloud/#3rd-party-driver-plugins
- 접속할 Env를 정의한다.
```shell
docker-machine create ...
```

### Show Env list
```shell
docker-machine ls
```
```log
NAME        ACTIVE   DRIVER    STATE     URL
custombox   *        none      Running   tcp://50.134.234.20:2376
```

### change active env
- when use docer command. the command work on the env

```shell
$(docker-machine env dev)


```
- when invoke `docker-machine env dev`, it prints the below, so, need to use eval $() to activate
```shell
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://0.0.0.0:8888"
export DOCKER_CERT_PATH="/var/lib/jenkins/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"
# Run this command to configure your shell: 
# eval $(docker-machine env dev)
```

- deactivate env
```shell
docker-machine env -u
```

### Update docker image
- update on dev env
```shell
docker-compose --verbose -f docker-compose.yml stop dev
docker-compose --verbose -f docker-compose.yml pull dev
docker-compose --verbose -f docker-compose.yml up --no-deps -d dev
```

### SSH access

```shell
docker-machine ssh dev "echo 123"
```