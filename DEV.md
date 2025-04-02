# Building and pushing images

To build an image,

```docker
docker build -t materialsvirtuallab/matml -f docker/Dockerfile .
```

Pushing the image to the repository.

```docker
docker push materialsvirtuallab/matml
```

The `build_all.sh` script will build and push all images in the docker folder.
