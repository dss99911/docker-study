# Script

## Build
```
sh script/build.sh
```

## Study
- [Create Repository](study/create-repository.md)
- [Docker command](study/docker-command.md)
- [Dockerfile](study/dockerfile.md)
- [Docker Compose](study/docker-compose.md)
- [Docker Compose command](study/docker-compose-command.md)
- [Docker Machine](study/docker-machin.md)
- [etc](study)
## Run Dev
```shell
docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"
```

# TODO
- [ ] [Docker Overview](https://docs.docker.com/get-started/overview/)
- [ ] Understanding Todo source code
  - spec folder
  - how does docker recognize MYSQL_HOST, MYSQL_USER, etc?
    
- [ ] github에서 docker자동 재빌드하게 하기(Docker hub provide auto-build)
- [ ] container orchestration framework
  - manage cluster. and delegate work to worker node
  - [ ] [Security related blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
  - [ ] Kubernetes, Swarm, Nomad, and ECS
  
# Troubleshooting
- [error](study/error.md)