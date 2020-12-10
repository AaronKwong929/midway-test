# FROM node:latest
# WORKDIR /project/jdn
# COPY . /project/jdn
# RUN npm install --registry https://registry.npm.taobao.org
# RUN npm run build
# EXPOSE 7001
# CMD ["npm", "run", "start_build"]

FROM node:latest
WORKDIR /project/jdn
COPY package.json /project/jdn
RUN cd /project/jdn && RUN npm install --registry https://registry.npm.taobao.org

COPY . /project/jdn
RUN npm run build
EXPOSE 7001
CMD ["npm", "run", "start_build"]