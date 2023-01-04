#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=paularinze/my-app

# Step 2:  
# Authenticate & tag
echo "$DP" | docker login -u "paularinze" --password-stdin
docker tag my-app $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
