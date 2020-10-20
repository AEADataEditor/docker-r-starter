# Docker image basic R image

## Purpose

Many R replication packages have dependencies, which sometimes include the specific version of R (in particular before/after release of v4).
This Docker image is meant to isolate and stabilize that environment, and should be portable across
multiple operating system, as long as [Docker](https://docker.com) is available.

## Build

### Adjust the needed packages

See the [setup.R](setup.R) file, and update accordingly.

> WARNING: not all packages might build, depending on whether the R base image has the relevant libraries. You might want to change R base image, or switch to another image from [rocker](https://hub.docker.com/u/rocker).

### Build the image

```
docker build  .
```

## Publish the image

The resulting docker image can be uploaded to [Docker Hub](https://hub.docker.com/), if desired, Find the image ID, this will also have been the output of the `docker build` command.

```
...
Removing intermediate container cb12e70b0154
 ---> 52e8f83a14f8
Successfully built 52e8f83a14f8
```

or list your images:

```
docker images 
```
output:
```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              52e8f83a14f8        25 seconds ago      665MB
<none>              <none>              fb095c3f9ade        31 minutes ago      670MB
<none>              <none>              a919483dbe22        34 minutes ago      107MB
```

Now you can upload it. Set the `TAG` and `IMAGEID` accordingly.

```
IMAGEID=52e8f83a14f8
TAG=1409
MYHUBID=larsvilhuber
MYIMG=aearep
docker tag $IMAGEID $MYHUBID/${MYIMG}:$TAG
docker tag $IMAGEID $MYHUBID/${MYIMG}:latest
docker push $MYHUBID/${MYIMG}
```

## Using the image

If using a pre-built image on [Docker Hub](https://hub.docker.com/repository/docker/larsvilhuber/):

```
docker run -it -rm larsvilhuber/${MYIMG}
```

If using the image you just created:

```
docker run -it --rm larsvilhuber/${MYIMG}
```

You can now start to compile code.

## NOTE

This entire process could be automated, using [Travis-CI](https://docs.travis-ci.com/user/docker/#pushing-a-docker-image-to-a-registry) or [Github Actions](https://github.com/marketplace/actions/build-and-push-docker-images). Not done yet.
