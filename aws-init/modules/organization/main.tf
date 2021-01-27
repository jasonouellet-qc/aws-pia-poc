data "aws_organizations_organization" "org" {
}

resource "aws_organizations_organizational_unit" "zones" {
  depends_on = [data.aws_organizations_organization.org]

  count     = length(var.liste_ou)
  name      = var.liste_ou[count.index]
  parent_id = data.aws_organizations_organization.org.roots[0].id
}
