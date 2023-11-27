#!/bin/bash
# define what you want to run

cd programs
for arg in $(ls [0-9]*.R)
do
  echo "Running $arg"
  R CMD BATCH $arg
done