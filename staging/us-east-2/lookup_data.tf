data "aws_route53_zone" "tabeapps" {
  name = "bgreencitylabs.com."
}

########## Amazon Certificate Manager Lookup for ALB ###########
data "aws_acm_certificate" "alb_cert" {
  domain      = "www.stage.bgreencitylabs.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}