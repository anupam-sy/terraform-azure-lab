# Authentication Specific Variables
variable "azure_subscription_id" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_tenant_id" {}

# Variable Definition - RG, Location
variable "rg_name" {
  description = "Azure Resouce Group Name"
}

variable "location" {
  description = "Azure Resouce Group Location"
  default     = "UK South"
}

variable "rs_tags" {
  description = "Azure Resource Tags"
  default = {
    "Project"     = "FC"
    "Environment" = "TST"
  }
}

# Variable Definition - IaaS Resources
variable "avset_names" {}

# Variable Definition - PaaS Resources
variable "appsp_names" {}

# Variable Definition - Database Resources
variable "sqlsvr_name" {}
variable "epool_name" {}

