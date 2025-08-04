resource "azurerm_storage_account" "saccount" {
    name = "sa${var.project}s${var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard" //datalake -> almacenar info no estructurada
    account_replication_type = "LRS" //redundancia local

    tags = var.tags
}

resource "azurerm_storage_account" "saccount2" {
    name = "safunctsettingss${var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard" //datalake -> almacenar info no estructurada
    account_replication_type = "LRS" //redundancia local

    tags = var.tags
}

resource "azurerm_storage_container" "c1" {
    name = "reportes"
    container_access_type = "private"
    storage_account_id = azurerm_storage_account.saccount.id
}

resource "azurerm_storage_queue" "q1" {
    name = "requests"
    storage_account_name = azurerm_storage_account.saccount.name
}