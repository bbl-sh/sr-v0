#!/bin/bash

# Set image name
IMAGE_NAME="fullstack-app"

# Step 1: Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Step 2: Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Docker image build failed. Exiting."
    exit 1
fi

echo "Docker image built successfully!"

# Step 3: Run the Docker container
echo "Running Docker container..."
docker run -p 5173:5173 -p 3000:3000 $IMAGE_NAME

# Step 4: Inform the user
if [ $? -eq 0 ]; then
    echo "Docker container is running."
    echo "Frontend: http://localhost:5173"
    echo "Backend: http://localhost:3000"
else
    echo "Failed to run the Docker container."
fi
