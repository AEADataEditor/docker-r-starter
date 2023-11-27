# R 4.1.2 released November 2021. 
# Pass variables into the file
ARG VERSION=4.3.1
ARG TYPE=r-ver
ARG SETUP=setup.R

FROM rocker/$TYPE:$VERSION

COPY ${SETUP} setup.R
RUN Rscript setup.R


