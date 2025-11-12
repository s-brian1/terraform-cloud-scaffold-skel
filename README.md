# terraform-cloud-scaffold-skel

This repository scaffolds Terraform modules and environment layers for AWS, Azure and GCP. Below are quick instructions to get started running Terraform for each cloud provider on the dev container (Ubuntu 24.04.2 LTS).

Prerequisites
- A working dev container (Ubuntu 24.04).
- Install Terraform, CLI tools and provider CLIs (examples below).
- Clone this repo and open in VS Code.

Install Terraform (example)
```bash
sudo apt update
sudo apt install -y wget gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor \
  | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform
```

Common Terraform workflow
```bash
# from a working directory (e.g., environments/dev or examples/aws-simple)
terraform init
terraform plan -var-file="terraform.tfvars"    # or -var-file="secrets.tfvars"
terraform apply -var-file="terraform.tfvars"
terraform destroy -var-file="terraform.tfvars"
```

AWS
- Install CLI: sudo apt install -y awscli
- Authenticate:
  - Interactive: aws configure
  - Environment variables (CI/automation):
    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    export AWS_DEFAULT_REGION=us-east-1
- Backend: use S3 + DynamoDB or Terraform Cloud. Configure backend in environments/*/backend.tf.
- Example:
```bash
cd environments/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Azure
- Install CLI:
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
- Authenticate:
  - Interactive: az login
  - Service principal for automation:
```bash
az ad sp create-for-rbac --name "tf-sp" --role Contributor \
  --scopes /subscriptions/<SUB_ID>
# set:
export ARM_CLIENT_ID=...
export ARM_CLIENT_SECRET=...
export ARM_SUBSCRIPTION_ID=...
export ARM_TENANT_ID=...
```
- Example:
```bash
cd environments/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

GCP
- Install gcloud (follow Google repo install) or use package:
```bash
sudo apt install -y google-cloud-sdk
```
- Authenticate:
  - Interactive: gcloud auth login
  - Service account (recommended for CI): create key JSON and set:
    export GOOGLE_CREDENTIALS="$(cat /path/to/key.json)"
    export GOOGLE_PROJECT=your-project-id
- Example:
```bash
cd environments/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Modules & examples
- Reusable modules live under modules/ (aws/, azure/, gcp/).
- Examples and environment layers are under examples/ and environments/.
- To test a module, cd into the example that consumes it and run the common Terraform workflow.

Terraform Cloud / Remote state
- If using Terraform Cloud, add/modify backend.tf in the environment folder with your organization and workspace.
- For S3/AzureRM/GCS backends, supply credentials and bucket/container names via environment variables or backend configuration.

Useful docs (open in host browser)
- Terraform: $BROWSER https://www.terraform.io/docs
- AWS provider: $BROWSER https://registry.terraform.io/providers/hashicorp/aws/latest
- Azure provider: $BROWSER https://registry.terraform.io/providers/hashicorp/azurerm/latest
- GCP provider: $BROWSER https://registry.terraform.io/providers/hashicorp/google/latest

Notes
- Keep secrets out of repo. Use environment variables, secret manager, or CI secret stores.
- Adjust region/project/subscription and terraform.tfvars per environment.