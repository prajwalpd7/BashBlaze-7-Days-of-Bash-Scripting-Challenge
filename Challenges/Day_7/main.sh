#!/bin/bash

# main script which is going to execute transfer of application files to remote and then run the deploy script

# Transferring application files to remote
./secure_transfer.sh flask-app

# Running the deploy script
./remote_execute.sh "cd ~/received/flask-app; chmod 700 deploy_app.sh; ./deploy_app.sh"
