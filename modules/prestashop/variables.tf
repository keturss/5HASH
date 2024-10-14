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

variable "replica_count" {
  description = "Nombre de réplicas PrestaShop pour scalabilité"
  type        = number
  default     = 1
}

variable "prestashop_version" {
  description = "Version de PrestaShop à utiliser"
  type        = string
  default     = "8.1-apache"
}

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

variable "versions" {
  type        = string
  default     = "8.1-apache"
  description = "PrestaShop version"
}

variable "disable_make" {
  type        = string
  default     = "0"
  description = "Disable make in PrestaShop"
}

variable "ps_install_auto" {
  type        = string
  default     = "0"
  description = "Auto install PrestaShop"
}

variable "db_prefix" {
  type        = string
  default     = "ps_"
  description = "Database prefix"
}

variable "ps_domain" {
  type        = string
  default     = "localhost:8001"
  description = "PrestaShop domain"
}

variable "ps_folder_install" {
  type        = string
  default     = "install-dev"
  description = "PrestaShop install folder"
}

variable "ps_folder_admin" {
  type        = string
  default     = "admin-dev"
  description = "PrestaShop admin folder"
}

variable "ps_country" {
  type        = string
  default     = "fr"
  description = "PrestaShop country"
}

variable "ps_language" {
  type        = string
  default     = "en"
  description = "PrestaShop language"
}

variable "ps_dev_mode" {
  type        = string
  default     = "1"
  description = "Enable developer mode"
}

variable "ps_enable_ssl" {
  type        = string
  default     = "0"
  description = "Enable SSL"
}

variable "ps_erase_db" {
  type        = string
  default     = "0"
  description = "Erase database on install"
}

variable "ps_use_docker_maildev" {
  type        = string
  default     = "1"
  description = "Use Docker Maildev"
}

variable "admin_mail" {
  type        = string
  default     = "demo@prestashop.com"
  description = "Admin email"
}

variable "admin_passwd" {
  type        = string
  default     = "pwd12345"
  description = "Admin password"
}

variable "blackfire_enable" {
  type        = string
  default     = "0"
  description = "Enable Blackfire"
}

variable "blackfire_server_id" {
  type        = string
  default     = "0"
  description = "Blackfire server ID"
}

variable "blackfire_server_token" {
  type        = string
  default     = "0"
  description = "Blackfire server token"
}
