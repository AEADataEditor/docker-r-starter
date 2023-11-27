#!/bin/bash
PWD=$(pwd)

. ${PWD}/.myconfig.sh

docker pull $dockerrepo

if [[ $? == 1 ]]
then
  ## maybe it's local only
  docker image inspect $dockerrepo> /dev/null
  [[ $? == 0 ]] && BUILD=no
fi

docker run -e DISABLE_AUTH=true \
   -v $WORKSPACE:/home/rstudio/project \
   --rm -p 8787:8787 \
   $dockerrepo
