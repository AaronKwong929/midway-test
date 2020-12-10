# FROM node:latest
# WORKDIR /project/jdn
# COPY . /project/jdn
# RUN npm install --registry https://registry.npm.taobao.org
# RUN npm run build
# EXPOSE 7001
# CMD ["npm", "run", "start_build"]

FROM node:latest as build
WORKDIR /project/jdn
COPY package.json index.js ./
RUN npm install --registry https://registry.npm.taobao.org --only=production

FROM node:latest
COPY --from=build /project/jdn /
COPY . /
EXPOSE 7001
CMD ["npm", "run", "start_build"]