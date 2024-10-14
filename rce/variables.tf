variable "prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prod"
}

variable "prestashop_version" {
  description = "Version prestashop"
  type        = string
  default     = "8.1-apache"
}

variable "network" {
  description = "Docker network"
  type        = string
  default     = "my_prestashop_network-prod"
}

variable "db_user" {
  description = "User pour bdd"
  type        = string
  sensitive = true
}

variable "db_passwd" {
  description = "Sensitive user password pour bdd"
  type        = string
  sensitive = true
}

variable "db_name" {
  description = "Nom bdd"
  type        = string
  default     = "prestashop_db"
}

variable "admin_mail" {
  description = "Address mail administrateur"
  type        = string
  default     = "admin@admin.fr"
}

variable "admin_passwd" {
  description = "password administrateur"
  type        = string
  default     = "aze"
}

variable "replica_count" {
  description = "Nombres de réplica voulue"
  type = number
  default = 5
}

