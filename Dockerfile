FROM node:12-alpine as docker-study
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]


# Multi-stage docker file
FROM docker-study as test2
CMD ["echo", "test2"]