FROM ubuntu:trusty
MAINTAINER Arnaud Bailly <arnaud.oqube@gmail.com>

## ensure locale is set during build
ENV LANG            C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y make build-essential software-properties-common

RUN add-apt-repository -y ppa:cassou/emacs && \
    apt-get update -qq && \
    apt-get -f install && \
    apt-get install -qq emacs24 emacs24-el
