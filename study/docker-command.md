https://www.youtube.com/watch?v=odmG6RJQboE&list=PLRx0vPvlEmdChjc6N3JnLaX-Gihh5pHcx&index=4

### 이미지 빌드하기
- 현재 path의 Dockerfile을 빌드함
- -t : tag (이미지 이름)
```
docker build -t example .
```

### 이미지 다운로드 받기
```
docker pull ndb796/docker-practice
```

### 이미지 실행
- 이미지가 remote repo에 있는 경우에도 run으로 실행시켜도 됨(이 경우, 이미지를 다운 받고, 실행 시킴.)
- -p : port
- -d : detached (background에서 실행)
```
docker run -p 8080:8080 --rm --name zeppelin apache/zeppelin:0.9.0
```

#### 이미지 실행명령어와 다른 명령어 호출하기
- CMD의 명령어를 호출하는 대신에 Command를 호출함.
```shell
sudo docker run [image_name] [Command]
```

### 설치된 이미지들 보기
```
docker images
```

### 이미지 삭제하기
- -f : force
```
docker rmi -f <image id> # find id from `docker images`
```

### 실행 중인 컨테이너 확인
```
docker ps -a
```

### 실행중인 컨테이너 삭제
- -f : force (force stop the container then remove)
```
docker rm -f <container id> # find container id by `docker ps -a`

# 현재 켜져있는 모든 컨테이너 삭제하기
docker rm -f `docker ps -a -q`
```

### Run. 실행 시키기
- -p : 포트 매칭
- -v : volume (path matching) : https://docs.docker.com/storage/volumes/
- -d : daemon (백그라운드에서 실행. 재부팅시에는 재실행 안됨)
- -i : interactive
- -e : environment `-e AA=BB`
```
docker run -p 8080:80 -v /home/ec2-user/example:/var/www/html example
```

### Named Volume
- docker실행시키는 서버에서, docker 내부와 연결할 path를 지정하지 않고, 이름만 설정해주면, 외부의 임의 path를 생성해서 연결시켜줌
- 그래서, path를 별도로 지정해주는 번거로움 없이, 외부에 path를 지정가능
- 만약 생성하지 않고, named volume을 쓰게 되면, volume을 자동으로 만듬
```
docker volume create todo-db

docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

docker volume inspect todo-db # you can see where the path of the volume
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```



### 컨테이너 start/stop/kill
- docker rm은 컨테이너를 삭제하여, 내부에 있는 데이터가 삭제된다.
- 데이터 삭제 없이 컨테이너 사용을 중단시키고 싶으면 stop이나, kill을 사용.
- 다시 실행시킬 때, start를 호출하면 됨
```
docker start 10ab5b8ed5c2
docker stop 10ab5b8ed5c2
docker kill 10ab5b8ed5c2
```

### 컨테이터 디테일 확인하기
- gateway ip address
  - mysql가 컨테이너에 설치된 경우. 해당 ip로 접속할 수 있음

```
docker inspect <container-id>
```

### 컨테이너 내부에 접속하는 방법
- docker exec -it <container-id> /bin/bash
- mysql처럼 ip로 접속 가능한 경우 -> gateway ip address로
- port맵핑을 통해 실행한 경우, 맵핑된 port로도 접속 가능
- https://www.youtube.com/watch?v=gmE_8oSZ-mo&list=PLRx0vPvlEmdChjc6N3JnLaX-Gihh5pHcx&index=5
- 배쉬 접속해서 mysql 접속하는 방법
  ![dd](img/connect-bash.jpg)


### Restart Policy
- https://www.digitalocean.com/community/questions/how-to-start-docker-containers-automatically-after-a-reboot
```
docker run -d --restart unless-stopped redis
docker run -d --restart unless-stopped -p 8090:8080 --name zeppelin apache/zeppelin:0.9.0
```


### 컨테이너에 있는 파일을 외부로 복사하는 방법
```
docker cp <containerId>:/file/path/within/container /host/path/target
```

### 도커 로그 확인하기
- -f follow (show logs continuously)
```shell
docker logs -f 2fe24b9564b5
```