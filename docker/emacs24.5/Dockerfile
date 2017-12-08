FROM ubuntu:xenial
MAINTAINER Arnaud Bailly <arnaud.oqube@gmail.com>

## ensure locale is set during build
ENV LANG            C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y wget make build-essential software-properties-common

RUN apt-get install -y emacs24-nox emacs24-el
