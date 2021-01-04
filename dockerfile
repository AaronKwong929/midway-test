# FROM node:15.5.0-alpine3.10
# WORKDIR /project/jdn
# COPY package.json /project/jdn
# RUN cd /project/jdn && npm install --registry https://registry.npm.taobao.org --legacy-peer-deps
# COPY . /project/jdn
# RUN npm run build
# EXPOSE 7001
# CMD ["npm", "run", "start_build"]

FROM alpine AS builder
WORKDIR /project/jdn
RUN apk add --no-cache --update nodejs nodejs-npm
COPY package.json package-lock.json ./
RUN npm install

FROM alpine
WORKDIR /project/jdn
RUN apk add --no-cache --update nodejs nodejs-npm
COPY --from=builder /project/jdn/node_modules ./node_modules
COPY . /project/jdn
# RUN npm run build
EXPOSE 7001
CMD ["npm", "run", "start_build"]
