#!/bin/bash

## Install Docker
apt-get update
apt-get -y install curl

curl -sSL https://get.docker.com/ | sh

## Install Git
apt-get -y install Git

## Build ASP.NET Core HelloWeb Docker container
git clone https://github.com/aspnet/Home.git /usr/local/src/aspnet-Home
cd /usr/local/src/aspnet-Home/samples/1.0.0-rc1-final/HelloWeb

docker build -t helloweb .

# Configure Helloweb to startup automatically, start it.
touch /etc/systemd/system/docker-helloweb.service
cat << EOF > /etc/systemd/system/docker-aspnet_core.service
[Unit]
Description=ASPNET MVC Core container
Requires=docker.service
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run -t -d -p 80:5004 helloweb
ExecStop=/usr/bin/docker stop -t 5 helloweb

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl start docker-helloweb.service
systemctl enable docker-helloweb.service