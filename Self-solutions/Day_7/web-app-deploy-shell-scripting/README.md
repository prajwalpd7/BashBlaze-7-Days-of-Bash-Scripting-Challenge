# Kubernetes Microservice Flask Application

This is a microservice application built using Flask and deployed on Kubernetes. It is designed to demonstrate how to build and deploy microservices on a Kubernetes cluster.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

First prepare the kubernetes master and worker environments with the below reference
https://github.com/lerndevops/educka/blob/master/1-intall/install-kubernetes-v1.24-ubuntu-debian.md 

To install and run the application on your Kubernetes cluster, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project root directory.
3. Create a Kubernetes deployment and service by running the following command:

`kubectl apply -f kubernetes.yaml`

4. Verify that the deployment and service have been created successfully by running the following command:

`kubectl get deployments,services`

5. If everything is working properly, you should see the name of your deployment and service listed in the output.

## Usage

To use the microservice, you can send HTTP requests to the service's endpoint. Here's an example request:

`curl http://<service-ip>:<service-port>/tasks`


This should return a JSON response with a greeting message.

## Contributing

If you'd like to contribute to this project, please fork the repository and create a new branch. Pull requests are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE.md] and thanks to Shubham Londe for the references.
