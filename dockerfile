FROM node:latest

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

WORKDIR /project/jdn

COPY . /project/jdn

RUN npm install --registry https://registry.npm.taobao.org

RUN npm run build

EXPOSE 7001

CMD ["npm", "run", "start"]

