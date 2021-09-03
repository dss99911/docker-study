### docker hub

- github에 Dockerfile이 바뀌면, 자동으로 재 빌드해준다고함.
- maven처럼 repository역할
- jenkins처럼 빌드해서 이미지를 생성함
- 우리는 생성된 이미지를 다운 받아서 실행만 시키면 됨.


### login
private repository를 사용하기 위해선 로그인 해야함.
```shell
docker login

```