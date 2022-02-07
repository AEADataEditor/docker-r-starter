# R 4.1.2 released November 2021. 
FROM rocker/r-ver:4.1.2

COPY setup.R .
RUN Rscript setup.R


