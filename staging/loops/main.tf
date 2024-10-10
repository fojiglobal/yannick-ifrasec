resource "aws_iam_user" "name" {
count = length(var.infrase_users)
name = var.infrase_users[count.index]
}

resource "aws_iam_user" "Managers" {
for_each = toset(var.managers)
name = each.value
}

# resource "aws_vpc" "VPCs" {
#   for_each = var.vpcs
#   cidr_block = each.value["cidr"]
#   tags = each.value["tags"]
#   enable_dns_hostnames = each.value["enable_dns"]
#}