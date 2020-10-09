FROM rocker/r-ver:4.0.1

COPY setup.R .
RUN Rscript setup.R


