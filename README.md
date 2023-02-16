# Terraform Azure Lab
This repository contains Terraform code for infrastructure deployment on Azure Public Cloud.

## Prerequisites
Below prerequisites must be fulfilled for successful execution of code.

### Software Requirement
Resources in this repository are meant for use with Terraform 1.0.0 (Check the version using `terraform version`). If you don't have the compatible version, download it from official Terraform repository. See [Installation-Guide](./docs/install.md) on how to install Terraform.

-   [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
-   [terraform-provider-azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/2.46.0) plugin = 2.46.0
-   [terraform-provider-random](https://registry.terraform.io/providers/hashicorp/random/3.0.0) plugin = 3.0.0

### Permissions Requirement
In order to execute these templates you must have:
- An App registered on Azure Active Directory 
- App ID is given "Owner" role on the subscription(s) where you want to deploy the resources
- For the azurerm backend authentication, you can choose any authentication like storage account access key or managed service identity. Check the terraform official documentation mentioned below in reference section.

**Note:** 
1. Terraform recommends using either a Service Principal or Managed Service Identity when running Terraform non-interactively (such as when running Terraform in a CI server) - and authenticating using the Azure CLI when running Terraform locally.

2. Make sure to not pass the sensitive informations (like App ID, App Secret, Subscription ID, Tenant ID and Backend storage account access key) in your terraform code. Though store as an environment variables or as a secret variables in CICD, if using pipelines.

3. An storage account must pre-exist in order to store the state files, if using remote backend. It is typically recommended to use some kind of remote backend (generally storage account, if deploying resources on azure) to ensure the safety of state file(s) and enable the collobaration of peers in project.

4. Access can be more fine-grained to follow Principle of least privilege (PoLP). But, typically AD APP used for infrastructure provisioning using terraform has privileged access in order to successfully deploy all the resources.

5. To deploy resources to different subscriptions with different credentials, you can utilize the alias attribute on the provider block in Terraform to have multiple azurerm providers configured for different Azure Subscription and/or different Azure Service Principal credentials (client id / secret).

## Execution
To execute the Terraform code, go to command prompt and then run the following commands:

-   [Required] `terraform init`
-   [Optional] `terraform validate`
-   [Optional] `terraform fmt`
-   [Optional] `terraform plan`
-   [Required] `terraform apply -auto-approve`

**Note:** See [Terraform-Guide](./docs/info.md) to get real-quick overview of Terraform.

## References
- https://medium.com/@gmusumeci/getting-started-with-terraform-and-microsoft-azure-a2fcb690eb67
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
- https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
- https://marileeturscak.medium.com/the-difference-between-app-registrations-enterprise-applications-and-service-principals-in-azure-4f70b9a80fe5
