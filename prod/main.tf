module "mysql" {
    source = "../modules/mysql"
    
    network_name    = var.network
    container_name_prefix = var.prefix
    db_passwd   = "prestashop"
    db_name     = "aaaaa"
    db_replication_password = "azeaze"
    db_replication_user = "azezez"
}

module "nginx" {

    source = "../modules/nginx"

    network_name          = var.network
    container_name_prefix = var.prefix
    replica_count         = var.replica_count
    load_balancer_port    = 8080

}

module "prestashop" {
    source = "../modules/prestashop"
    
    prestashop_version    = "8.1-apache"
    network_name          = var.network
    container_name_prefix = var.prefix
    db_passwd             = var.db_passwd
    db_name               = var.db_name
    replica_count         = var.replica_count
    admin_mail            = var.admin_mail
    admin_passwd          = var.admin_passwd
    
}






