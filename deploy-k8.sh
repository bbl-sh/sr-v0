#!/bin/bash

# Check if Minikube is running
echo "Checking Minikube status..."
minikube status > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Minikube is not running. Starting Minikube..."
    minikube start
fi

# Set Docker environment to use Minikube's Docker daemon
echo "Setting up Docker environment for Minikube..."
eval $(minikube docker-env)

# Build the Docker image
IMAGE_NAME="fullstack-app:latest"
echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

echo "Docker image built successfully!"

# Apply Kubernetes configurations
echo "Applying Kubernetes configurations..."
kubectl apply -f k8s/fullstack-deployment.yaml
kubectl apply -f k8s/fullstack-service.yaml

# Check deployment status
echo "Waiting for pods to be ready..."
kubectl wait --for=condition=ready pod -l app=fullstack-app --timeout=120s

if [ $? -ne 0 ]; then
    echo "Pods failed to become ready. Exiting."
    exit 1
fi

# Get the Minikube service URL
echo "Fetching Minikube service URL..."
minikube service fullstack-service --url

echo "Deployment complete. Access your app using the above URL."
