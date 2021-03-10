# Initialisation de services communs

Mise en place d'une délégation de sous-domaine DNS
Mise en place d'un service SES

## Documentation

### Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.14.0 |
| aws | ~> 3 |

### Providers

No provider.

### Modules

| Name | Source | Version |
|------|--------|---------|
| dns | ./modules/dns |  |
| ses | ./modules/ses |  |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | Compte AWS | `string` | n/a | yes |
| aws\_profile | Nom du profil de connexion IaC | `string` | n/a | yes |
| environnement | Code de l'environnement | `string` | n/a | yes |
| external\_id | External identifier to use when assuming the role | `string` | n/a | yes |
| projet | Code de projet | `string` | n/a | yes |
| region | Région de déploiement | `string` | `"ca-central-1"` | no |
| role\_name | Rôle de la connexion | `string` | n/a | yes |
| session\_name | External identifier to use when assuming the role | `string` | n/a | yes |

### Outputs

No output.
