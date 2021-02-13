# Terraform Code Sets
This repository contains Terraform code for Individual Resource deployment on Azure Public Cloud.

## Prerequisite:
Terraform must be installed on your system. To verify Terraform is working, Type below command in command prompt to check the terraform version.

	terraform --version

## Variable Precedence
If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

Environment variables
1. The terraform.tfvars file, if present.
2. The terraform.tfvars.json file, if present.
3. Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
4. Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)


## Execution:
For multiple environment provisioning, use different tfstate files in backend. To execute the Terraform code, go to command prompt and then run the following commands:

	[Required] terraform init
	[Optional] terraform validate

	[Optional] terraform fmt
	. The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style.

	[Optional] terraform plan -var-file="resource.tfvars" -out=tfplan
	[Required] terraform apply -var-file="resource.tfvars" -auto-approve
	
	[Optional] terraform state list
	
	. The command will list all resources in the state file matching the given addresses (if any). If no addresses are given, all resources are listed.

	[Optional] terraform output
	. The terraform output command is used to extract the value of an output variable from the state file.

	[Optional] terraform show
	. The terraform show command is used to provide human-readable output from a state or plan file. This can be used to inspect the current state as Terraform sees it.

	[Optional] terraform destroy -target="resource_type.resource_name"
	. The terraform destroy command is used to destory the resources defined in your Terraform configuration. To delete the specific resource, use the "target" option with destroy command.

## Reference:

> https://medium.com/@gmusumeci/getting-started-with-terraform-and-microsoft-azure-a2fcb690eb67
