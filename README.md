# Docker image basic R image

## Purpose

Many R replication packages have dependencies, which sometimes include the specific version of R (in particular before/after release of v4).
This Docker image is meant to isolate and stabilize that environment, and should be portable across
multiple operating system, as long as [Docker](https://docker.com) is available.

## Build

### Adjust the needed packages

See the [setup.R](setup.R) file, and update accordingly.

> WARNING: not all packages might build, depending on whether the R base image has the relevant libraries. You might want to change R base image, or switch to another image from [rocker](https://hub.docker.com/u/rocker).

### Setup info

Set the `TAG` and `IMAGEID` accordingly.

```
TAG=v$(date +%F)
MYIMG=AER-9999-8888
MYHUBID=aeadataeditor
```
### Build the image

```
docker build  . -t $MYIMG:$TAG
```
or if using the newer build system 
```
DOCKER_BUILDKIT=1 docker build . -t $MYIMG:$TAG
```

## Publish the image

The resulting docker image can be uploaded to [Docker Hub](https://hub.docker.com/), if desired.

```
docker push $MYHUBID/${MYIMG}:$TAG
```

## Using the image

If using a pre-built image on [Docker Hub](https://hub.docker.com/repository/docker/larsvilhuber/):

```
docker run -it --rm $MYHUBID/${MYIMG}:$TAG
```

If using the image you just created:

```
docker run -it --rm $MYHUBID/${MYIMG}:$TAG
```

Somewhat more sophisticated, if you are in a project directory (for instance, the replication package you just downloaded), you can access it directly within the image as follows:

```
docker run -it --rm -v $(pwd)/subdir:/code -w /code $MYHUBID/${MYIMG}:$TAG
```


You can now start to run code.

## NOTE

This entire process could be automated, using [Travis-CI](https://docs.travis-ci.com/user/docker/#pushing-a-docker-image-to-a-registry) or [Github Actions](https://github.com/marketplace/actions/build-and-push-docker-images). Not done yet.
