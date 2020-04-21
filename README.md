# Prisma prod with Heroku

This repository have a Dockerfile to build a prisma-prod with the heroku flavor in it.

## Prerequisites

1. A Registry account.
2. Docker installed.
3. This repo cloned

## Automated Script
1. Run `./build.sh <tag>` where `tag` is the `prismagraphql/prisma-prod` to base this image from

## Step-by-step 

2. Login on your registry: `docker login --username=yourhubusername --email=youremail@example.com`
3. Build & Tag your image: `docker build --build-arg tag=${TAG} -t yourhubusername/prisma-prod:${TAG}`
4. Push the image to the registry: `docker push yourhubusername/prisma-prod`
