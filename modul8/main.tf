terraform {
  required_version = ">= 1.16.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.4"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

locals {
  name_prefix = "${var.kortnavn}-${var.project}"
}

resource "azurerm_resource_group" "main" {
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = { managed_by = "pipeline" }
}

module "network" {
  source              = "./modules/network"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}