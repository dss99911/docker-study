
```
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```
- FROM node:12-alpine : 이미지를 가져옴
- WORKDIR /app : container내부의 해당 path를 working directory로 설정
- COPY . . : 현재 디렉토리의 소스들을 workdir로 복사
-  RUN yarn install --production : 소스 코드 실행에 필요한 디팬던시 설치
- CMD ["node", "src/index.js"] : 컨테이너 실행할 때, 호출할 명령어
