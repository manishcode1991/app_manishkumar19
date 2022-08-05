# Docker

## Login Docker repo
docker login registry.gitlab.com

## Create Base Image

Go to Base folder and create base image with following commands

docker build -t registry.gitlab.com/manishkumar19/poc/base:latest .

## Tag Base Image
docker tag registry.gitlab.com/manishkumar19/poc/base:latest registry.gitlab.com/manishkumar19/poc

## Push Base Image
docker push registry.gitlab.com/manishkumar19/poc/base:latest



## Create Dev Image

docker build  . -t registry.gitlab.com/manishkumar19/poc/dev:latest -f docker/dev/Dockerfile


## Run Docker Container from dev image 

docker run -d --network host --env-file docker/dev/.env --name poc registry.gitlab.com/manishkumar19/poc/dev 

## Tag Dev Image
docker tag registry.gitlab.com/manishkumar19/poc/dev:latest registry.gitlab.com/manishkumar19/poc

## Push Dev Image
docker push registry.gitlab.com/manishkumar19/poc/dev:latest




## Create Prod Image

docker build  . -t registry.gitlab.com/manishkumar19/poc/prod:latest -f docker/release/Dockerfile


## Run Docker Container from Prod image 

docker run -d --network host --env-file docker/release/.env --name poc_prod registry.gitlab.com/manishkumar19/poc/prod 

## Tag prod Image
docker tag registry.gitlab.com/manishkumar19/poc/prod:latest registry.gitlab.com/manishkumar19/poc

## Push prod Image
docker push registry.gitlab.com/manishkumar19/poc/prod:latest



