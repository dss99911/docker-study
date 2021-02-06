## Doc
- [ ] [Docker Compose](https://docs.docker.com/compose/)

- Compose는 multi container 를 하나의 network안에 설정할 때 쓴다.

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

## Start Compose
- -d detached
```shell
docker-compose up -d
```

## Remove Compose
```shelld
docker-compose down
```


## show logs
```shell
docker-compose logs -f
docker-compose logs -f app # only the specific app
```

## Wait port
[Wait port](https://github.com/dwmkerr/wait-port)

When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it. Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready before starting another container. For Node-based projects, you can use the wait-port dependency. Similar projects exist for other languages/frameworks.