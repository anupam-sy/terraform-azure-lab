# Bootstrap Azure for Terraform
Deploying infrastructure as code on Azure using Terraform requires a bootstrap process. 

## Requirements
Bootstrap process requires the following tasks to be performed:

1. A Service Principal on Azure Active Directory with a secret.
2. A Resource Group to house storage account, if using azurerm backend.
3. A Storage Account and a Container inside it to store the Terraform state files. Make sure to disable public access for the storage account. You can lock the resource group or the storage account itself to avoid accidental its deletion.
4. A role (typically Owner/Contributor) to the Service Principal on Subscription(s) to create new resources on Azure.

**Note:** 
- Creating an Application Registration in Azure Active Directory will create an associated Service Principal.

## Permissions
To execute the bootstrap steps (either manually or thru script), you’ll need to have the following permissions:
- An Owner Role on the target Azure Subscription.
- An Application Administrator / Global Administrator Role on Azure Active Directory.

**Assumptions:** 
Below assumptions has been made for the bootstrap process.
- A tenant is created which represents your organization.
- A subscription is created using one of the provided billing account type.

**Note:**
- Tenant can either have Azure Active Directory or Azure Active Directory (B2C) for managing the users and identities. 
- Azure Active Directory (Azure AD) tenants come with an initial domain name, <domainname>.onmicrosoft.com. You can't change or delete the initial domain name, but you can add your organization's custom domain name.
- When a user signs up for a Microsoft azure cloud service, a new Azure AD tenant is created and the user becomes a Global Administrator for that tenant. Global Administrator can assign administrator roles to others.
- If a person wants to add more tenants and signs up for the Azure Active Directory tenant, he becomes a Global Administrator for that tenant.
- Global Administrator is a Cross-service role that span across all services, that means, All Microsoft 365 services honor Global Administrator role. But, Application Administrator is an Azure AD-specific role. 
- Each subscription is associated with an Azure AD directory. Each subscription can have a different billing and payment setup.

## References
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
- https://www.mytechramblings.com/posts/how-to-bootstrap-terraform-and-azdo-to-start-deploying-iac-to-azure/
- https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/view-all-accounts
- https://learn.microsoft.com/en-us/azure/active-directory/roles/concept-understand-roles
- https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles
- https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups