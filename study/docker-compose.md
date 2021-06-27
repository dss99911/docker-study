## Doc
- [ ] [Docker Compose](https://docs.docker.com/compose/)


## Compose를 쓰는 방식
- 서버에 여러 서비스가 있는데, 도커 없이는 매번 여러 프로그램을 설치하고, 연계하고, 설정해주고, 해야 하는데, (가능한 한) 모든 서비스는 docker image로 실행시키고, 각 서비스들과의 소통은 compose를 통해서 처리
    - 예) nginx에서 jupyter notebook으로 bypass하기
- Compose는 multi container 를 하나의 network안에 설정할 때 쓴다.
- container를 실행시킬 때 필요한 여러 설정값을 정의해서, 실행시 그냥 실행 시키면 됨
- image 신규 버전을 pull하기 위해서도 쓰는 듯

## Install
[Install Docker Compose](https://docs.docker.com/compose/install/)

## Create docker-compose.yml
[docker-compose.yml](../docker-compose.yml)

### Set Compose version
[version reference](https://docs.docker.com/compose/compose-file/)

### compose Service
- network-alias is defined same with the service name

### volume

- if no mountpoint is defined, then the default options are used.

## Build compose
```shell
docker-compose build
#different file name
docker-compose -f docker-compose-deploy.yml up --build
```


## Start Compose
- -d detached
```shell
docker-compose up -d
```

## Remove Compose
```shell
docker-compose down

#To stop and delete containers, delete volumes with database data and download images
docker-compose down --volumes --rmi all

```

## Run on container
- run command on `web` container
- after building web container, run the command.
```shell
sudo docker-compose run web django-admin startproject composeexample .
```



## show logs
```shell
docker-compose logs -f
docker-compose logs -f app # only the specific app
```

## Wait port
[Wait port](https://github.com/dwmkerr/wait-port)

When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it. Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready before starting another container. For Node-based projects, you can use the wait-port dependency. Similar projects exist for other languages/frameworks.