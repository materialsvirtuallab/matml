for name in ml_lammps matml
do
  docker build -t materialsvirtuallab/$name -f docker/Dockerfile.$name .
  docker push materialsvirtuallab/$name
done
