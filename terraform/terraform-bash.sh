#!/bin/bash

# Define variables
TERRAFORM_DIR="terraform" # Directory containing Terraform files
ACTION=$1 # Action to perform (init, plan, apply, destroy)
AWS_REGION="ap-south-1" # Default AWS region

# Function to check for errors
check_error() {
  if [ $? -ne 0 ]; then
    echo "Error occurred during $1. Exiting."
    exit 1
  fi
}

# Navigate to the Terraform directory
if [ ! -d "$TERRAFORM_DIR" ]; then
  echo "Terraform directory ($TERRAFORM_DIR) not found. Exiting."
  exit 1
fi

cd $TERRAFORM_DIR

# Set environment variables for AWS
echo "Setting AWS environment variables..."
export AWS_REGION=$AWS_REGION
export $(cat ../sample.env | xargs)
check_error "setting environment variables"

# Perform the specified Terraform action
case $ACTION in
  init)
    echo "Initializing Terraform..."
    terraform init
    check_error "Terraform initialization"
    ;;
  plan)
    echo "Planning Terraform deployment..."
    terraform plan
    check_error "Terraform planning"
    ;;
  apply)
    echo "Applying Terraform configuration..."
    terraform apply -auto-approve
    check_error "Terraform apply"
    ;;
  destroy)
    echo "Destroying Terraform-managed infrastructure..."
    terraform destroy -auto-approve
    check_error "Terraform destroy"
    ;;
  *)
    echo "Invalid action. Usage: ./deploy-terraform.sh [init|plan|apply|destroy]"
    exit 1
    ;;
esac

echo "Terraform $ACTION completed successfully."
