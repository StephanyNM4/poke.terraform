provider "azurerm" {
    subscription_id = var.subscription_id
    features {} //configuraciones globales en la suscripcion
}

//rg: nombre del objeto a nivel del proyecto
resource "azurerm_resource_group" "rg" {
    name = "rg-${var.project}-${var.environment}" //nombre del recurso cuando se despliega en azure
    location = var.location //proveedor
    tags = var.tags //información de proyecto
}
