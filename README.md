# 5HASH

## Structure du projet 

Ce projet est disponible dans 2 environments pour déployer l'infrastructure.

*   **rce** : Environnement de pré-production.
*   **prod** : Environnement de production.

### Modules 

Dans le dossier `modules/` on retrouve trois composants réutilisables pour définir l'infrastructure :

**mysql**

*   `main.tf` : Contient la configuration des ressources MySQL.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 

**nginx**

*   `main.tf` : Contient la configuration des ressources NGNIX.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 
*   `nginx.conf.tpl` : Contient un modèle de configuration pour NGNIX. 

**prestashop**

*   `main.tf` : Contient la configuration des ressources PrestaShop.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 


## Démarrage

### Prérequis

*   Terraform doit être installé sur la machine.
*   Docker doit être installé sur la machine.

### Environnement

Choissisez votre environnement de déploiement :

```Bash
cd "prod"
```
### Mots de Passes

Avant de pouvoir déployer l'infrastructure, il faut mettre en place les variables d'environnements suivantes : 

```Bash
export TF_VAR_admin_passwd=somesecret
export TF_VAR_mysql_password=somesecret
export TF_VAR_mysql_root_password=somesecret
```

### Déploiement

Une fois dans le dossier d'environnement voulue et les variables export, on peut commencer le déploiement de l'infrastructure par Terraform.

#### Commandes Terraform 

1. **Initialisez le projet pour télécharger les plugins**
```Bash
terraform init
```
2. **Visualiser le plan d'exécution**
```Bash
terraform plan
```
3. **Déploiement de l'infrastructure**
```Bash
terraform deploy
```
4. **Détruire l'infrastructure**
```Bash
terraform destroy
```

#### Scalabilités et Variables

Il est possible d'augmenter et de réduire le nombre de ressource pour chaques modules depuis le dossier d'environnement : 

*   Par le fichier `main.tf` pour modifier le nombre de réplicat MySQL : modification de la ligne `mysql_replica_count`

*   Par le fichier `variables.tf` pour modifier le nombre de réplicat des NGNIX et PrestaShop : modification de la variable `replica_count`

*   Vous pouvez modifier toutes autres variables dans le `main.tf` ou le `variables.tf` pour modifier les valeurs de l'infrastructure. 

Une fois les valeurs modifiées, il vous suffira de faire un : 
```Bash
terraform plan
```
Pour visualiser les modifications et enfin :
```Bash
terraform deploy
```
Pour déployé la nouvelle infrastructure
