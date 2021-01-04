# FROM node:15.3.0-alpine
# WORKDIR /project/jdn
# COPY . /project/jdn
# RUN npm install --registry https://registry.npm.taobao.org
# RUN npm run build
# EXPOSE 7001
# CMD ["npm", "run", "start_build"]

FROM node:15.3.0-alpine
# RUN apk --update add tzdata \
#     && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#     && echo "Asia/Shanghai" > /etc/timezone \
#     && apk del tzdata

# RUN echo "Asia/Shanghai" > /etc/timezone

RUN npm install npm@latest

WORKDIR /project/jdn
COPY package.json /project/jdn
RUN cd /project/jdn && npm install --registry https://registry.npm.taobao.org

COPY . /project/jdn
RUN npm run build
EXPOSE 7001
CMD ["npm", "run", "start_build"]