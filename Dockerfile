# R 4.1.2 released November 2021. 
# Pass variables into the file
ARG VERSION=4.3.1
ARG TYPE=r-ver

FROM rocker/$TYPE:$VERSION

COPY setup.R .
RUN R CMD BATCH setup.R


