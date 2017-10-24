############################################################
# Dockerfile to build a ubuntu installation for running tests.
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:16.04

# Set the right File Type
RUN export LANG=C.UTF-8

# File Author / Maintainer
MAINTAINER TheJawker

# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################
# Install
RUN apt-get install -qy \
    software-properties-common \
    python-software-properties \
    nginx \
    git \
    curl

RUN apt-get update

# Add repository for PHP7.1 and Python 3.7
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:jonathonf/python-3.6

RUN apt-get update -y

RUN apt-get install -y \
    php7.1 \
    mysql-client \
    sqlite \
    zip \
    unzip \
    php-soap \
    libxml2-dev


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN pip install numpy

RUN apt-get install -y \
    php-mcrypt \
    php-soap
