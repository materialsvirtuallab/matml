# Introduction

This repository provides tools for managing the MatML ecosystem, including building of Docker images.

# Available Docker Images

All docker images are at the [Materials Virtual Lab Docker Repository].

# Running code

Assuming you have your script `script.py` in the current directory, you can run it using:

```docker
docker run --name test -v .:/work -t materialsvirtuallab/matml python /work/script.py
```

If you need to get a file out of your docker container, use:

```docker
docker cp test:<filename> .
```

[Materials Virtual Lab Docker Repository]: https://hub.docker.com/orgs/materialsvirtuallab/repositories
