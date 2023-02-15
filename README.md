# Terraform Azure Lab
This repository contains Terraform code for infrastructure deployment on Azure Public Cloud.

## Prerequisites
Below prerequisites must be fulfilled for successful execution of code.

### Software Requirement
Resources in this repository are meant for use with Terraform 1.0.0 (Check the version using `terraform version`). If you don't have the compatible version, download it from official Terraform repository. See [Installation-Guide](./docs/install.md) on how to install Terraform.

-   [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
-   [terraform-provider-azurerm] plugin = 2.46.0
-   [terraform-provider-random] plugin = 3.0.0

### Permissions Requirement
In order to execute these templates you must have:
- An App registered on Azure Active Directory 
- App ID is given "Owner" role on the subscription where you want to deploy the resources.

**Note:** 
1. Make sure to not pass the sensitive informations (like App ID, App Secret, Subscription ID, Tenant ID) in your terraform code. Though store as an environment variables or as a secret variables in CICD, if using pipelines.

2. An storage account must pre-exist in order to store the state files, if using remote backend. It is typically recommended to use some kind of remote backend (generally storage account, if deploying resources on azure) to ensure the safety of state file(s) and enable the collobaration of peers in project.

3. Access can be more fine-grained to follow Principle of least privilege (PoLP). But, typically AD APP used for infrastructure provisioning using terraform has privileged access in order to successfully deploy all the resources.

## Execution
To execute the Terraform code, go to command prompt and then run the following commands:

-   [Required] `terraform init`
-   [Optional] `terraform validate`
-   [Optional] `terraform fmt`
-   [Optional] `terraform plan`
-   [Required] `terraform apply -auto-approve`

**Note:** See [Terraform-Guide](./docs/learn.md) to get real-quick overview of Terraform.

## References

- https://medium.com/@gmusumeci/getting-started-with-terraform-and-microsoft-azure-a2fcb690eb67
