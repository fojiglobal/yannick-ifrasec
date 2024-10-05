variable "enable_dns" {
  type = bool
  default = false
  
}


 ########Public Subnets Variable ######
variable "public_subnets" {
  type = map(object({
    cidr = string
    azs = string
    tags = map(string)
    enable_public_ip = bool
  }))
}

########Private Subnets Variable ######
variable "private_subnets" {
  type = map(object({
    cidr = string
    azs = string
    tags = map(string)
  }))
}

variable "env" {
  type = string
}

variable "vpc_cidr" {
  type = string
}