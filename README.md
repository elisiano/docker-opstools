# opstools container

This container is aimed at ops people needing a container inside a kubernetes cluster to do some maintenance (eg: a mysqldump and write that to an s3 bucket).

It was created out of frustration of having to install the same utilities over and over again on a base image.

You can find an example kubernetes deployment on its github repo ([elisiano/docker-opstools](https://github.com/elisiano/docker-opstools)), but here's an inline copy for conveniency

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: opstools
  name: opstools
spec:
  replicas: 1
  selector:
    matchLabels:
      app: opstools
  template:
    metadata:
      labels:
        app: opstools
    spec:
      containers:
      - args:
        - bash
        - -c
        - while true; do sleep 3600; done
        image: elisiano/opstools
        name: opstools
```
