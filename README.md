# Terraform-mastering
Terraform-mastering



# Terraform Project — Guide de Référence 🛠️

## Table des matières

1. [Description du projet](#description-du-projet)  
2. [Architecture & fichiers](#architecture--fichiers)  
3. [Variables](#variables)  
4. [Ressources (Resources)](#ressources-resources)  
5. [Outputs](#outputs)  
6. [Bloc Terraform / Providers](#bloc-terraform--providers)  
7. [Commandes essentielles](#commandes-essentielles)  
8. [Bonnes pratiques & conventions](#bonnes-pratiques--conventions)  
9. [Licence](#licence)  

---

## Description du projet

Ce dépôt contient une configuration Terraform pour déployer une infrastructure AWS simple.  
L’objectif est d’apprendre et de démontrer les concepts de base de Terraform (variables, outputs, ressources, modules, etc.).  
Chaque fichier `.tf` est organisé pour la clarté, la modularité et la maintenabilité.

---

## Architecture & fichiers

├── terraform.tf # Configuration Terraform générale (providers, versions)
├── variables.tf # Définition des variables du projet
├── main.tf # Définition des ressources à créer
├── outputs.tf # Sorties utiles après déploiement
├── terraform.tfvars # (optionnel) Valeurs personnalisées
└── README.md # Ce fichier


- **terraform.tf** : spécifie les providers requis, versions, contraintes  
- **variables.tf** : déclare les variables que tu peux personnaliser  
- **main.tf** : décrit les ressources que Terraform crée  
- **outputs.tf** : expose des informations utiles après l’exécution  
- **terraform.tfvars** : (facultatif) pour surcharger les valeurs de variables  

---

## Variables

Définir des variables permet de rendre la configuration paramétrable et flexible.

### Exemple dans `variables.tf` :

variable "region" {
  description = "Région AWS utilisée"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type d’instance EC2"
  type        = string
  default     = "t2.micro"
}

description — explication claire

type — type attendu (string, number, bool, list, map…)

default — valeur par défaut si aucun override n’est donné

Personnaliser ou surcharger

Créer un fichier terraform.tfvars (ou *.auto.tfvars) :

region = "eu-west-1"
instance_type = "t3.micro"


Ou passer directement via la ligne de commande :

terraform apply -var="region=eu-west-1"

# Ressources (Resources)

Une ressource représente un élément d’infrastructure que Terraform gère (création, modification, suppression).

Syntaxe :
resource "TYPE" "NAME" {
  # attributs
}


TYPE : type de ressource (ex : aws_instance, aws_s3_bucket)

NAME : nom local pour référence dans ton code

Exemple :
resource "aws_instance" "demo_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name        = "DemoServer"
    Environment = "dev"
  }

  user_data = file("startup.sh")
}




# Outputs

Les outputs permettent d’afficher ou d’utiliser les résultats de Terraform.

Exemple :
output "instance_id" {
  description = "ID de l’instance EC2"
  value       = aws_instance.demo_server.id
}

output "public_ip" {
  description = "Adresse IP publique"
  value       = aws_instance.demo_server.public_ip
}


value : expression à exposer

description : pour documenter l’output

Tu peux aussi utiliser sensitive = true pour masquer les données sensibles

Récupérer les valeurs :
terraform output
terraform output public_ip
terraform output -json

Bloc Terraform / Providers

Déclare les providers nécessaires et les versions compatibles.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  required_version = ">= 1.2"
}


required_providers : indique les plugins à utiliser

required_version : version minimale de Terraform

Licence

Ce projet est sous licence MIT — tu es libre de l’utiliser, le modifier, le partager.

“Un bon README, c’est comme une lumière sur ton chemin : chaque dev qui le lit doit savoir instantanément comment utiliser ton projet.”