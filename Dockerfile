FROM node:16.16.0

MAINTAINER Nagarro<manish.kumar19@nagarro.com>

#update system
RUN apt-get update

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY src/package*.json ./

# Install app dependencies
RUN npm install --only=production

# Bundle app source
COPY src/ .

# expose our port
EXPOSE 7100

# Add entrypoint script
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
