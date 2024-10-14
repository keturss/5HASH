
variable "network_name" {
  description = "Nom du réseau Docker"
  type        = string
  default     = "prestashop-network"
}

variable "container_name_prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prestashop"
}
variable "db_passwd_root" {
  type        = string
  default     = "prestashop"
  description = "MariaDB root password"
}

variable "db_user" {
  description = "Nom de l'utilisateur MySQL"
  type        = string
  default     = "prestashop_user"
}

variable "db_passwd" {
  type        = string
  default     = "prestashop"
  description = "MariaDB root password"
}

variable "db_name" {
  type        = string
  default     = "prestashop-master"
  description = "MariaDB database name master"
}

variable "db_replication_password" {
  type        = string
  default     = "prestashop"
  description = "MariaDB root password"
}

variable "db_replication_user" {
  type        = string
  default     = "prestashop-slave"
  description = "MariaDB database name slave"
}
