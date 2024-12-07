resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "ALL"

}

resource "aws_organizations_account" "CS2-secops" {
  name  = "CS2-secops"
  email = "gracesecops@gmail.com"
  parent_id = aws_organizations_organizational_unit.cs2_secops.id
}

resource "aws_organizations_account" "CS2-sandbox" {
  name  = "CS2-sandbox"
  email = "gracesandbox5@gmail.com"
  parent_id = aws_organizations_organizational_unit.cs2_sandbox.id
}

resource "aws_organizations_organizational_unit" "cs2_secops" {
  name      = "secops_OU"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "cs2_sandbox" {
  name      = "sandbox_OU"
  parent_id = aws_organizations_organization.org.roots[0].id
}