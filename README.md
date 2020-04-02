# ubi8-tornado
UBI 8 Python Tornado server

This Dockerfile defines an image for building a Red Hat Universal Base Image (UBI) 8 that runs a [Tornado Python web server](https://www.tornadoweb.org/).

## Build with buildah
```bash
$ buildah bud -t rhc4tp/ubi8-tornado .
```

## Run and test with podman
```bash
$ podman run -d -p 8888:8888 rhc4tp/ubi8-tornado
$ curl http://localhost:8888
```
