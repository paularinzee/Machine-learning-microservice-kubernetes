[![CircleCI](https://dl.circleci.com/status-badge/img/gh/paularinzee/microservice-kubernetes/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/paularinzee/microservice-kubernetes/tree/master)
## Project Overview

This project aims at operationalize a Machine Learning Microservice API. 

A pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on is used in this project. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project goal

Operationalize machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications.

### Project features

* Circleci for CI/CD
* Build and run a docker image of prediction-app 
* Upload prediction-app container to docker hub
* Deploy the container using Kubernetes and make a prediction

### Some files and directories explanation
* `.circleci` contains pipeline script
* `model_data/housing.csv` contains sample data to predict from
* `app.py` prediction program
* `requirements.txt` contains application dependencies
* `output_txt_files` contains sample of app running logs

## Setup the Environment

### Requirements

* [Python 3.7 is required](https://phoenixnap.com/kb/how-to-install-python-3-ubuntu)
* [Hadolint](https://github.com/hadolint/hadolint)
* [kubernetes](https://kubernetes.io/releases/download/)
* [minikube](https://minikube.sigs.k8s.io/docs/start/)
* [Create docker account](https://hub.docker.com/)
* Edit dockerpath in `upload_docker.sh` and `run_kubernetes.sh`

### Install dependencies

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
```bash
$ cd microservice-kubernetes/
# Run make setup to create virtualenv and activate it
$ make setup
# Run make install to install the necessary dependencies
$ make install
# Run make lint to check python script and dockerfile
$ make lint

### Build container and run
```bash
# Build and run 
$ ./run_docker.sh
# Make a prediction
$ ./make_predicton.sh
```

### Upload the container to Docker Hub
```bash 
$ ./upload_docker.sh
```

### Run in kubernetes
```bash 
# Start a cluster
$ minicube start
# Run container in kubernetes (run script again after pod creation)
$ ./run_kubernetes
# Check pod status
$ kubectl get pods prediction-app
# Make a prediction (be sure web app is running on port 8000)
$ ./make_predicton.sh
# Delete the pod
$ kubectl delete pods prediction-app
# Stop the cluster and delete
$ minicube stop && minicube delete
