# Terraform Infrastructure Project

This project is designed to provision cloud resources using Terraform across multiple cloud providers, including AWS, Azure, and GCP. It utilizes modules for reusable components, making it easy to manage and scale infrastructure.

## Project Structure

```
terraform-infra
├── modules
│   ├── aws
│   │   ├── vpc
│   │   ├── compute
│   │   └── storage
│   ├── azure
│   │   ├── vnet
│   │   ├── vm
│   │   └── storage
│   └── gcp
│       ├── vpc
│       ├── compute
│       └── storage
├── environments
│   ├── dev
│   └── prod
├── examples
│   └── aws-simple
├── scripts
│   └── bootstrap.sh
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars.example
├── .gitignore
└── README.md
```

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- Access to AWS, Azure, or GCP accounts with appropriate permissions.

### Setup

1. Clone the repository:
   ```
   git clone <repository-url>
   cd terraform-infra
   ```

2. Configure your provider credentials:
   - For AWS, set up your `~/.aws/credentials` file.
   - For Azure, use the Azure CLI to log in.
   - For GCP, set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to your service account key file.

3. Customize the `terraform.tfvars` file with your desired variable values.

### Usage

To initialize the Terraform project, run:
```
terraform init
```

To plan the deployment, run:
```
terraform plan
```

To apply the changes and provision the resources, run:
```
terraform apply
```

### Modules

This project includes reusable modules for each cloud provider:

- **AWS Modules**: VPC, EC2, S3
- **Azure Modules**: VNet, VM, Storage
- **GCP Modules**: VPC, Compute Engine, Cloud Storage

### Examples

Refer to the `examples` directory for sample configurations demonstrating how to use the modules.

### Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

### License

This project is licensed under the MIT License. See the LICENSE file for details.