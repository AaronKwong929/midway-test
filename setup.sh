#!/bin/bash
if  docker ps |grep midway;then
    # docker stop $ITEM_NAME
    # docker rename  $ITEM_NAME $PROJECT_NAME
    # docker run -ti -d --name $ITEM_NAME $IMG_MANGER/node:v1.0
    #docker rmi -f`docker images | grep "<none>" | awk "{print \$3}"`
    docker stop midway
    docker rm midway
    docker rmi midwaytest
fi

#docker stop midway
#docker rm midway
#docker rmi midwaytest
docker build -t midwaytest . &&
docker images &&
docker run -itd --name=midway -p 7001:7001 midwaytest