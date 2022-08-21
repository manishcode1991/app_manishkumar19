# app_manishkumar19

## Login Docker repo
docker login 

## Create Develop Image 

# create docker Develop image 
docker build -t i-manishkumar19-develop:latest .

## Tag Develop Image
docker tag i-manishkumar19-develop:latest manishsurbo/i-manishkumar19-develop:latest

## Push Develop Image
docker push manishsurbo/i-manishkumar19-develop:latest

## Run Docker Container from dev image 
docker run -d --network host --env-file .env  i-manishkumar19-develop:latest



## Create Master Image 

# create docker Master image 
docker build -t i-manishkumar19-master:latest .

## Tag Master Image
docker tag i-manishkumar19-master:latest manishsurbo/i-manishkumar19-master:latest

## Push Master Image
docker push manishsurbo/i-manishkumar19-master:latest

## Run Docker Container from Master image 
docker run -d --network host --env-file .env i-manishkumar19-master:latest

