#!/bin/bash

## Install Docker
apt-get update
apt-get -y install curl

curl -sSL https://get.docker.com/ | sh

## Install Git
apt-get -y install Git

## Build and run ASP.NET Core HelloWeb Docker container
https://github.com/dotnet/core.git /usr/local/src/dotnetcore
cd /usr/local/src/dotnetcore/samples/dotnetbot

docker build -t dotnetbot .

docker run -d -p 80:80 dotnetbot