# Resource block to deploy PaaS SQL Server
resource "azurerm_mssql_server" "tst_sqlsvr" {
  name                = var.sqlsvr_name
  resource_group_name = data.azurerm_resource_group.tst_rg.name
  location            = var.location
  version             = "12.0"

  administrator_login          = join("", [var.sqlsvr_name, "-admin"])
  administrator_login_password = random_string.tst_sqlsvr_pwd.result

  tags = {
    Project     = var.rs_tags["Project"]
    Environment = var.rs_tags["Environment"]
  }
}