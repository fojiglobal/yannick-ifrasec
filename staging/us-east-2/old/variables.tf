####### vpc variable ###
variable "staging_vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"

}

###### Availability zone variable #######
variable "use2a" {
  type    = string
  default = "us-east-2a"

}

variable "use2b" {
  type    = string
  default = "us-east-2b"

}

variable "staging_evn" {
  type    = string
  default = "staging"

}

####### Instance Type #########
variable "t2_micro" {
  type    = string
  default = "t2.micro"

}

############# ports and Protocol ###########
variable "alb_port_http" {
    type = string
    default = "80"
}

variable "alb_port_https" {
    type = string
    default = "443"
}

variable "alb_protocol_http" {
    type = string
    default = "HTTP"
}

variable "alb_protocol_https" {
    type = string
    default = "HTTPS"
}

########## SSL Profile ##########
variable "alb_ssl_profile" {
    type = string
    default = "ELBSecurityPolicy-2016-08"
}
