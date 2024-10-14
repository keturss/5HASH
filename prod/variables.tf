variable "prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prod"
}

variable "network" {
  description = "Docker network"
  type        = string
  default     = "my_prestashop_network-prod"
}


variable "db_user" {
  description = "User pour bdd mysql"
  type        = string
  default     = "prestashop_user"
}

variable "db_passwd" {
  description = "Sensitive user password pour bdd mysql"
  type        = string
  default     = "aze"
}
//TODO TRUe


variable "db_name" {
  description = "Nom bdd pour bdd mysql"
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
//TODO TRUE

variable "replica_count" {
  description = "Nombres de réplica voulue"
  type = number
  default = 5
}

