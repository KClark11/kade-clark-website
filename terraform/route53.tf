data "aws_route53_zone" "selected" {
 zone_id = "Z03484093JF7J54NY63KQ"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name = var.domain_name
  type = "A"
  alias {
    name = aws_s3_bucket_website_configuration.website.website_domain
    zone_id = aws_s3_bucket.website.hosted_zone_id
    evaluate_target_health = false
  }
}