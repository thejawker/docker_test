FROM php:7.1.1

RUN apt-get update && apt-get install -qy \
	git \
	curl \
	libmcrypt-dev \
	mysql-client \
	sqlite \
	zip \
	unzip \
	php-soap \
	libxml2-dev \
	software-properties-common \
	python-apt \
	python-software-properties
RUN apt-get update && apt-get install python3.6
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py
RUN pip install numpy
RUN docker-php-ext-install mcrypt && docker-php-ext-install pdo_mysql && docker-php-ext-install soap && docker-php-ext-install pcntl

