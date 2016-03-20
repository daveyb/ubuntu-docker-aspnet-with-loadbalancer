#!/bin/bash

## Install Docker
apt-get update
apt-get -y install curl

curl -sSL https://get.docker.com/ | sh

## Install Git
apt-get -y install Git

## Build and run ASP.NET Core HelloWeb Docker container
git clone https://github.com/aspnet/Home.git aspnet-Home
cd aspnet-Home/samples/1.0.0-rc1-final/HellowWeb

docker build -t helloweb .

docker run -t -d -p 80:5004 helloweb