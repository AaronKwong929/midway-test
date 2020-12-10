FROM node:latest

WORKDIR /project/jdn

COPY . /project/jdn

RUN npm install --registry https://registry.npm.taobao.org

RUN npm run build

EXPOSE 7001

# CMD ["rm", "-rf", "node_modules"]
RUN rm -rf node_modules

CMD ["npm", "run", "start"]

