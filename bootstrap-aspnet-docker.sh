#!/bin/bash

## Install Docker
apt-get update
apt-get -y install curl

curl -sSL https://get.docker.com/ | sh

## Install Git
apt-get -y install Git

## Build and run ASP.NET Core HelloWeb Docker container
git clone https://github.com/aspnet/Home.git /usr/local/src/aspnet-Home
cd /usr/local/src/aspnet-Home && git checkout 7ef9ea0
cd /usr/local/src/aspnet-Home/samples/1.0.0-rc1-final/HelloWeb

docker build -t helloweb .

docker run -t -d -p 80:5004 helloweb