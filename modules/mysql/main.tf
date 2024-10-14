# Define volume for MariaDB
resource "docker_volume" "db_data" {
  name = "db-data"
}

# Define container master
resource "docker_container" "mariadb_master" {
  name  = "mariadb-master"
  image = "mariadb:11.4"
  restart = "unless-stopped"

  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "MARIADB_ROOT_PASSWORD=${var.db_passwd}",
    "MARIADB_DATABASE=${var.db_name}",
    "MARIADB_REPLICATION_MODE=master",
    "MARIADB_REPLICATION_USER=${var.db_replication_user}",
    "MARIADB_REPLICATION_PASSWORD=${var.db_replication_password}",
    "MARIADB_BINLOG_FORMAT=row",       # Enable binary logging
    "MARIADB_LOG_BIN=binlog",          # Binary log file
    "MARIADB_SERVER_ID=1",             # Unique server ID
  ]

  command = [
    "--log-bin=mysql-bin",
    "--server-id=1",
    "--slave-skip-errors=all",
    "--relay-log=mysqld-relay-bin",
    "--relay-log-index=mysqld-relay-bin.index"
  ]

  networks_advanced {
    name = var.network_name
  }

  healthcheck {
    test        = ["CMD", "mysqladmin", "ping", "-h", "localhost"]
    interval    = "10s"
    timeout     = "5s"
    retries     = 5
    start_period = "30s"
  }
}

# Define container slave
resource "docker_container" "mariadb_slave" {
  name  = "mariadb-slave"
  image = "mariadb:11.4"
  restart = "unless-stopped"

  ports {
    internal = 3307
    external = 3307
  }


  env = [
    "MARIADB_ROOT_PASSWORD=${var.db_passwd}",
    "MARIADB_DATABASE=${var.db_name}",
    "MARIADB_REPLICATION_MODE=slave",
    "MARIADB_REPLICATION_USER=${var.db_replication_user}",
    "MARIADB_REPLICATION_PASSWORD=${var.db_replication_password}",
    "MARIADB_MASTER_HOST=mariadb-master",
    "MARIADB_MASTER_PORT_NUMBER=3306",
    "MARIADB_MASTER_ROOT_USER=root",
    "MARIADB_MASTER_ROOT_PASSWORD=${var.db_passwd}",
    "MARIADB_SERVER_ID=2",   # Unique server ID for the Slave
  ]

  command = [
    "--log-bin=mysql-bin",
    "--server-id=2",
    "--slave-skip-errors=all",
    "--relay-log=mysqld-relay-bin",
    "--relay-log-index=mysqld-relay-bin.index"
  ]

  depends_on = [
    docker_container.mariadb_master
  ]

  networks_advanced {
    name = var.network_name
  }

  healthcheck {
    test        = ["CMD", "mysqladmin", "ping", "-h", "localhost"]
    interval    = "10s"
    timeout     = "5s"
    retries     = 5
    start_period = "30s"
  }
}