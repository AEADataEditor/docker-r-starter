#!/bin/bash

TAG=v$(date +%F)
MYIMG=aer-9999-8888
MYHUBID=aeadataeditor

### Build the image
DOCKER_BUILDKIT=1 docker build . -t $MYHUBID/$MYIMG:$TAG

echo "Ready to push?"
echo "  docker push  $MYHUBID/${MYIMG}:$TAG"
read answer
case $answer in 
   y|Y)
   docker push  $MYHUBID/${MYIMG}:$TAG
   ;;
   *)
   exit 0
   ;;
esac


echo "You are good to go"
echo "docker run -it --rm -v \"\$(pwd)\":/project -w /project $MYHUBID/${MYIMG}:$TAG R CMD BATCH main.R"