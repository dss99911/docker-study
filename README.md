# Script

## Build
```
sh script/build.sh
```

## Run Dev
```shell
docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"
```


# Study
- [ ] [Docker Overview](https://docs.docker.com/get-started/overview/)
- [x] [Get Started](https://github.com/docker/getting-started)
- [x] [Play With Docker](https://labs.play-with-docker.com/)
- [x] [Create Repository](study/create-repository.md)
- [x] [Docker Process](study/docker-process.md)
- [x] [Docker Command](study/docker-command.md)
- [x] [Docker File](study/dockerfile.md)
- [x] [Docker Hub](study/dockerhub.md)
- [x] [Reason to use Docker](study/reason-to-use-docker.md)
- [x] [Multi Container Apps](study/multi-container.md)
- [ ] [Docker Compose](study/compose.md)
- [x] [Cache](study/cache.md)
- [ ] [Scan](study/scan.md)
- [ ] Understanding Todo source code
  - spec folder
  - how does docker recognize MYSQL_HOST, MYSQL_USER, etc?
    
- [ ] github에서 docker자동 재빌드하게 하기
- [ ] container orchestration framework
  - manage cluster. and delegate work to worker node
  - [ ] [Security related blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
  - [ ] Kubernetes, Swarm, Nomad, and ECS