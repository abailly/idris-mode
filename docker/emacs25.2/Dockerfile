FROM ubuntu:bionic
MAINTAINER Arnaud Bailly <arnaud.oqube@gmail.com>

## ensure locale is set during build
ENV LANG            C.UTF-8

RUN apt-get update -qq  && apt-get install -y make build-essential software-properties-common

RUN apt-get install -y emacs25-nox
