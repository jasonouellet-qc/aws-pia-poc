resource "aws_route53_zone" "sub" {
  provider = aws.iac
  name     = "pia.pocpdm.ca"
  tags     = var.tags
}

data "aws_route53_zone" "selected" {
  provider = aws.root
  name     = "pocpdm.ca"
}

resource "aws_route53_record" "sub-ns" {
  provider = aws.root
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "pia.pocpdm.ca"
  type     = "NS"
  ttl      = "30"
  records  = aws_route53_zone.sub.name_servers
}

/*
resource "aws_route53_record" "sub_example_com_zone_ns_record" {
  zone_id = "${aws_route53_zone.example_com.zone_id}"
  name    = "sub"
  type    = "NS"
  records = ["thirdparty.dns.server", "thirdparty2.dns.server"]
  ttl     = "86400"
}
*/
/*
resource "aws_route53_record" "sub_example_com_zone_default_ns_record" { 
  zone_id = "${aws_route53_zone.sub_example_com.zone_id}"
  type    = "NS" 
  name    = "sub.example.com" 
  records = ["thirdparty.dns.server", "thirdparty2.dns.server"] 
  ttl     = "86400" 
} 
*/
/*
resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.example.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.dev.name_servers
}
*/