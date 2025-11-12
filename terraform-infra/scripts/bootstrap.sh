#!/bin/bash

# This script is intended to bootstrap the Terraform environment for the project.
# It may include tasks such as installing necessary tools, initializing Terraform, and setting up the workspace.

# Update package list and install necessary tools
sudo apt update
sudo apt install -y unzip curl

# Install Terraform
TERRAFORM_VERSION="1.5.0" # Specify the desired Terraform version
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Initialize Terraform
terraform init

# Print completion message
echo "Bootstrap completed successfully."