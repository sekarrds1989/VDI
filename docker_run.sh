#!/bin/bash
set -e
set -x
#build docker
docker build -t my_work .
#run docker
#docker run -ti --user $(id -u):$(id -g) --net=host -v /localdisk/:/localdisk/ --name mycontainer my_work
docker run -ti --net=host -v /localdisk/:/localdisk/ --name mycontainer my_work
