
## Simple Build
```
FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]
```
- FROM node:12-alpine : 이미지를 가져옴. alpine은 light한 리눅스
- WORKDIR /app : container내부의 해당 path를 working directory로 설정 
- COPY package.json yarn.lock ./ : copy this, so that, if this files not changed, then use cache(밑에 COPY . . 와 별도로 먼저 복사하는 이유임.)
- RUN yarn install --production : 소스 코드 실행에 필요한 디팬던시 설치
- COPY . . : 현재 디렉토리의 소스들을 workdir로 복사
- CMD ["node", "src/index.js"] : 컨테이너 실행할 때, 호출할 명령어. 
    - 위에 명령어들은 모두 build시에 수행하는 명령어지만, 이건, runtime에 수행함.

## Multi-Stage Builds
- [Doc](https://docs.docker.com/develop/develop-images/multistage-build/)
- only last stage is contained on image.

### Maven/Tomcat Example
- name the first stage as 'build'
- COPY --from=build : copy files from 'build' stage
```dockerfile
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```

### React Example
```dockerfile
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```