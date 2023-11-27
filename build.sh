#!/bin/bash
myPWD=$(pwd)
. ${myPWD}/.myconfig.sh
  
# build the docker if necessary

BUILD=yes

if [[ "$BUILD" == "yes" ]]; then
  docker build . -t $dockerrepo
fi

# push the docker if wanted
# interactively query user for push
read -p "Push to dockerhub? (yes/no) " PUSH
PUSH=no
if [[ "$PUSH" == "yes" ]]; then
  echo "Pushing to $dockerrepo"
  nohup docker push $dockerrepo &
fi
