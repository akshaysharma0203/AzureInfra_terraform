resource "azurerm_resource_group" "httpd_rg" {
   name = "${var.regname}-${var.environment}-${var.reglocation}"
   location = var.reglocation
}

output "resource_group_name" {
  value = "${azurerm_resource_group.httpd_rg.name}"
}
