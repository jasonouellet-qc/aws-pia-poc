resource "aws_organizations_account" "accounts" {
  depends_on = [aws_organizations_organizational_unit.zones]
  for_each   = var.liste_comptes

  name      = each.value.name
  email     = each.value.email
  parent_id = aws_organizations_organizational_unit.zones[index(var.liste_ou, each.value.ou)].id
  role_name = "Admin${each.value.name}"

  tags = var.tags
}
/*
TODO: Créer une politique de TAG par environement (Compte)
resource "aws_organizations_policy" "tag_policies" {
  for_each = liste_env

  name = "TagPolicy${each.value.name}"
  description = "Politique de TAG de l'environnement - ${each.value.name}"
  type = "TAG_POLICY"

  tags = var.tags

  content = <<CONTENT
{
    "tags": {
        "Environment": {
            "tag_value": {
                "@@assign": [
                    "${var.liste_env[count.index]}"
                ]
            },
            "tag_key": "Environment"
        }
    }
}
CONTENT
}
*/

/*
TODO: Mettre la bonne politique sur le bon compte 1 compte / env.
resource "aws_organizations_policy_attachment" "environments_tag_policies" {
  count     = length(var.liste_account)
  policy_id = aws_organizations_policy.tag_policies[count.index].id
  target_id = aws_organizations_organizational_account.accounts[count.index].id

  depends_on = [aws_organizations_account.accounts, aws_organizations_policy.tag_policies]
}
*/
