## Multi-Container Apps

- the container only starts one process
- multiple container communicate within same network

### Create Network
```shell
docker network create todo-app
```

### Run Mysql to the network
```shell
docker run -d \
    --network todo-app --network-alias mysql \
    -v todo-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    mysql:5.7
```

### Check Mysql ip address
```shell
docker run -it --network todo-app nicolaka/netshoot
dig mysql #mysql is from `--network-alias mysql` above

#;; ANSWER SECTION:
#mysql.                  600     IN      A       172.18.0.2

```

### Run app with Mysql
- network-alias가 hostname으로 만들어지는 듯..
```shell
docker run -dp 3000:3000 \
--network todo-app \
-e MYSQL_HOST=mysql \
-e MYSQL_USER=root \
-e MYSQL_PASSWORD=secret \
-e MYSQL_DB=todos \
docker-sample
```