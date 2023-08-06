#!/bin/bash

# Commands to remotely execute on client1
ssh client1@192.168.6.131 ./deploy_app.sh

# Commands to remotely execute on client2
ssh client2@192.168.6.132 ./deploy_app.sh
