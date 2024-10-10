####### vpc variable ###
variable "staging_vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"

}

variable "infrase_users" {
  type = list(string)
  default = [ "jdoe", "jdone", "jbrown" ]
}

variable "managers" {
  type = list(string)
  default = [ "Bobama", "Kharis", "Jbiden" ]
}

#########VPCs Loops###########
# variable "vpcs" {
#   type = map(object({
#     cidr = string
#     tags = map(string)
#     tenancy = string
#     enable_dns = bool
#   }))

#   default = {

#     "staging" = {
#       cider = "10.50.0.0/16"
#       tenancy = "default"
#       enable_dns = false
#       tags ={
#         Name = "staging-vpc"
#         Environment = "staging"
#       }
#     }

#     "QA" = {
#       cidr = "10.60.0.0/16"
#       tenancy = "default"
#       enable_dns = false

#       tags ={
#         Name = "qa-vpc"
#         Environment = "qa"
#       }
#     }

#     "prod" = {
#       cider = "10.70.0.0/16"
#       tenancy = "default"
#       enable_dns = false

#       tags ={
#         Name = "prod-vpc"
#         Environment = "prod"
#       }
#     }
#   }  
# }