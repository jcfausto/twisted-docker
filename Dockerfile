FROM ubuntu:latest
MAINTAINER Julio Cesar Fausto <jcfausto@gmail.com>

RUN apt-get update -y
RUN apt-get upgrade -y

# Install pre-requisites
RUN apt-get -y install \
    libffi-dev \
    libssl-dev \
    python \
    python-dev \
    python-pip

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

# default port
ENV ECHO_SERVER_PORT=8000

CMD twistd --nodaemon --python=run_server.py