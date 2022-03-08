#!/bin/bash
cat ~/my_password.txt | docker login --username dinesh24591 --password-stdin
export TAG=$1
IMAGE_ID=hello-world-spring-boot:$TAG 
for i in `docker ps | grep hello-world-spring-boot:master | awk '{print $1}'`
do
 echo stopping containers $i to refresh
 docker stop $i
done

docker pull dinesh24591/hello-world-spring-boot:$TAG
docker run -it -p 8083:8080 dinesh24591/hello-world-spring-boot:$TAG





################USAGE and command to run####
##### referesh_containers.sh <imagetag>
######## e.g referesh_containers.sh master-13c849b
