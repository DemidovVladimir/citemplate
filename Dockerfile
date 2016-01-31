FROM ubuntu:14.04

MAINTAINER Vladimir Demidov "uncojet@gmail.com"


RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX

RUN apt-get update && apt-get install -y git
RUN apt-get -y dist-upgrade
RUN apt-get install -y curl


RUN curl https://install.meteor.com/ | sh

#Добавим ключ
RUN mkdir -p /root/.ssh

ADD /.ssh/id_rsa /root/.ssh/id_rsa

RUN chmod 700 /root/.ssh/id_rsa

#Создадим known_hosts
RUN touch /root/.ssh/known_hosts

#копируем репозиторий
git@github.com:DemidovVladimir/citemplate.git

WORKDIR /opt/application


EXPOSE 8080

CMD [ "meteor" ]

#https://github.com/DemidovVladimir/citemplate.git

