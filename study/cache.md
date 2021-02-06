
## Ignore files on build image

.dockerignore
```shell 
node_modules
```

## Cache with Copy
- when copy, it check if files are changed or not. 
  - and if the files are changed, process again.
  - but if not changed, use cache
```dockerfile
FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]
```

### check cache or not.
- when build image, check if it's using cache or not
```log
 => [internal] load build definition from Dockerfile                                                                                                                                                 0.0s
 => => transferring dockerfile: 43B                                                                                                                                                                  0.0s
 => [internal] load .dockerignore                                                                                                                                                                    0.0s
 => => transferring context: 34B                                                                                                                                                                     0.0s
 => [internal] load metadata for docker.io/library/node:12-alpine                                                                                                                                    0.0s
 => [1/5] FROM docker.io/library/node:12-alpine                                                                                                                                                      0.0s
 => [internal] load build context                                                                                                                                                                    0.0s
 => => transferring context: 19.33kB                                                                                                                                                                 0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                                                                        0.0s
 => CACHED [3/5] COPY package.json yarn.lock ./                                                                                                                                                      0.0s
 => CACHED [4/5] RUN yarn install --production                                                                                                                                                       0.0s
 => CACHED [5/5] COPY . .                                                                                                                                                                            0.0s
 => exporting to image                                                                                                                                                                               0.0s
 => => exporting layers                                                                                                                                                                              0.0s
 => => writing image sha256:35e5767225f228d9fdb173eea4fc41c17f5f624dd73f731d785c37c794f7fed3                                                                                                         0.0s
 => => naming to docker.io/library/docker-sample      
```