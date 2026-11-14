variable "name_prefix" {
  type        = string
  description = "Prefiks i ressursnavnene, f.eks. saqib-iac-dev."

  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.name_prefix))
    error_message = "name_prefix kan bare inneholde små bokstaver, tall og bindestrek (3–20 tegn)."
  }
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "ssh_source_prefix" {
  type        = string
  description = "Hvor SSH (port 22) er tillatt fra. Aldri \"*\"."
  default     = "VirtualNetwork" # Azure-tag: bare trafikk fra eget VNet
}
