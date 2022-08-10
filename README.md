# app_manishkumar19

## Login Docker repo
docker login 

# create docker image 
docker build -t i-manishkumar19-develop:latest .

## Tag Base Image
docker tag i-manishkumar19-develop:latest manishsurbo/i-manishkumar19-develop:latest

## Push Base Image
docker push manishsurbo/i-manishkumar19-develop:latest

## Run Docker Container from dev image 
docker run -d --network host --env-file .env --name nagp-assignment i-manishkumar19-develop:latest



## Create Master Image 

# create docker image 
docker build -t i-manishkumar19-master:latest .

## Tag Base Image
docker tag i-manishkumar19-master:latest manishsurbo/i-manishkumar19-master:latest

## Push Base Image
docker push manishsurbo/i-manishkumar19-master:latest

## Run Docker Container from dev image 
docker run -d --network host --env-file .env --name nagp-assignment i-manishkumar19-master:latest

