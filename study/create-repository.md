### clone docker repository sample source code
- alpine/git 은 git 명령어를 호출해줌. 그냥 git clone해도됨
![img](img/docker-repository1.png)

### build
- 이미지를 생성(docker101tutorial이라는 이름의 이미지 생성)
- 이미지를 빌드할 소스코드의 위치를 '.' 로 설정
![img2](img/docker-repository2.png)

### run
- 빌드한 이미지를 docker-tutorial이라는 이름으로 실행
![img3](img/docker-repository3.png)

### push repository
- 이미지를 dockerhub에 푸시
- tag명령어로 local의 tag(이미지 이름)과 리모트의 계정의 tag와 맵핑시키는 듯
![img4](img/docker-repository4.png)

### check repositories here
[repositories](https://hub.docker.com/repositories)