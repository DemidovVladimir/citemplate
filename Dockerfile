FROM node
MAINTAINER Demidov Vladimir <uncojet@gmail.com>

RUN npm cache clean -f && npm install -g n && n 0.10.30
RUN curl https://install.meteor.com/ | sh
RUN npm install --silent -g forever meteorite

ADD . ./meteorsrc
WORKDIR /meteorsrc

RUN mrt install && meteor bundle --directory /var/www/app
WORKDIR /var/www/app

RUN npm install phantomjs

ENV PORT 8080
ENV ROOT_URL http://127.0.0.1
ENV MONGO_URL mongodb://db:27017/test

EXPOSE 8080

RUN touch .foreverignore
CMD forever -w ./main.js


