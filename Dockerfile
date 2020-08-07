FROM node:12-alpine

# Set working directory
WORKDIR /data

# Add dependencies
RUN apk add bash 
RUN apk add --virtual build-dependencies \
        build-base \
        gcc \
        wget \
        git
RUN apk add git
RUN apk add python2
RUN apk add netcat-openbsd
RUN npm install -g gulp@2.3.0
RUN npm install -g nodemon

# Change current user to node
USER node

RUN mkdir /tmp/build

RUN pwd
RUN ls 
ADD package.json /tmp/build

WORKDIR /tmp/build

# Feeds npm local cache
RUN npm install

RUN rm -rf /tmp/build

WORKDIR /data

# The real command is specified in docker-compose.yml
CMD ["sleep", "10"]

