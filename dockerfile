FROM alpine AS builder
WORKDIR /project/node
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --update nodejs nodejs-npm
COPY package.json ./
RUN npm install --production --registry https://registry.npm.taobao.org

FROM node:latest
WORKDIR /project/jdn
COPY --from=builder /project/node/node_modules ./node_modules
COPY . /project/jdn
# RUN npm install --registry https://registry.npm.taobao.org
RUN npm run build
EXPOSE 7001

# CMD ["rm", "-rf", "node_modules"]
# RUN rm -rf node_modules

CMD ["npm", "run", "start_build"]

