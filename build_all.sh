#!/bin/bash

for name in ml_lammps matml matgl matgl_cuda
do
  docker build -t materialsvirtuallab/$name -f docker/Dockerfile.$name .
  docker push materialsvirtuallab/$name
done
