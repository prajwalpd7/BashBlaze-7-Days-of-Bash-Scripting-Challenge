#!/bin/bash

# Securely transfer files from server to client1
scp deploy_app.sh client1@192.168.6.131:/home/client1

# Securely transfer files from server to client2
scp deploy_app.sh client2@192.168.6.132:/home/client2

