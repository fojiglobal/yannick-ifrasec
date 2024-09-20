# resource "aws_route53_record" "www_tes" {
#   zone_id = data.aws_route53_zone.tabeapps.zone_id
#   name    = "www.${data.aws_route53_zone.tabeapps.name}"
#   type    = "A"
#   ttl     = "300"
#   records = ["10.0.0.2"]
# }