
# création du volume commun
resource "docker_volume" "prestashop_data" {
  name = "${var.container_name_prefix}-prestashop_data"
}

# network de tout les pods
resource "docker_network" "prestashop_network" {
  name = var.network_name
}

# Define the PrestaShop container
resource "docker_container" "prestashop_git" {  
  count = var.replica_count

  image = "prestashop/prestashop:8.1-apache"
  name  = "${var.container_name_prefix}-prestashop-${count.index}"

  ports {
   internal = 80
   external = "809${count.index}"
  }

  env = [
    "DISABLE_MAKE=${var.disable_make}",
    "PS_INSTALL_AUTO=${var.ps_install_auto}",
    "DB_PASSWD=${var.db_passwd}",
    "DB_NAME=${var.db_name}",
    "DB_SERVER=mariadb-master",
    "DB_PREFIX=${var.db_prefix}",
    "PS_DOMAIN=${var.ps_domain}",
    "PS_FOLDER_INSTALL=${var.ps_folder_install}",
    "PS_FOLDER_ADMIN=${var.ps_folder_admin}",
    "PS_COUNTRY=${var.ps_country}",
    "PS_LANGUAGE=${var.ps_language}",
    "PS_DEV_MODE=${var.ps_dev_mode}",
    "PS_ENABLE_SSL=${var.ps_enable_ssl}",
    "PS_ERASE_DB=${var.ps_erase_db}",
    "PS_USE_DOCKER_MAILDEV=${var.ps_use_docker_maildev}",
    "ADMIN_MAIL=${var.admin_mail}",
    "ADMIN_PASSWD=${var.admin_passwd}",
    "BLACKFIRE_ENABLE=${var.blackfire_enable}",
    "BLACKFIRE_SERVER_ID=${var.blackfire_server_id}",
    "BLACKFIRE_SERVER_TOKEN=${var.blackfire_server_token}",
  ]
  networks_advanced {
    name = var.network_name
  }
  volumes {
    container_path = "/var/www/html"
    volume_name = docker_volume.prestashop_data.name
  }

  restart = "unless-stopped"
}



