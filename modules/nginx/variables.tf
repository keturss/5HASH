variable "presta_shop_containers" {
  default = ["presta-shop-1", "presta-shop-2", "presta-shop-3"]
}

variable "container_name_prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prestashop"
}

variable "network_name" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prestashop"
}

variable "replica_count" {
  description = "Nombre de réplicas PrestaShop pour scalabilité"
  type        = number
  default     = 1
}

variable "load_balancer_port" {
  description = "Port exposé par le load balancer sur l'hôte"
  type        = number
  default     = 8080
}
