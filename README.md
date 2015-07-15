# start-rabbitmq
Powershell command to build and start a RabbitMQ docker container via powershell

## Prerequisites
- [Start-Docker](https://github.com/rafaelromao/start-docker) must be installed

## How to install it
- Download and unzip this repository
- Edit the file DockerFile to configure the RabbitMQ users as you wish
- Edit the file Start-RabbitMQ.psm1 to configure the name of your RabbitMQ container
- Run Install-Module.bat to install the start-rabbitmq module on powershell

## What will it do?
1. Run Start-Docker
2. Build a RabbitMQ docker image using the provided DockerFile, if necessary
3. Run the RabbitMQ docker image, if necessary
4. Restart the RabbitMQ docker image, if it is stopped or already running

## How to use it
- Run "start-rabbitmq"
- Access http://192.168.59.103:15672, or whatever is your boot2docker IP and try to log in as 'guest' to see if all is okay