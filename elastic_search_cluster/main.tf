/**

   Setup an AWS Elasticsearch Cluster using Cloudposse's module.
   
 */
module "elasticsearch" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=master"
  namespace               = "eg"
  stage                   = "dev"
  name                    = "es"
  dns_zone_id             = "Z3ASAVRQGUSGK0"
  security_groups         = ["sg-9debb6d0"]
  vpc_id                  = "vpc-c2c011b8"
  subnet_ids              = ["subnet-5dbd383a","subnet-82acf9c8"]
  zone_awareness_enabled  = "true"
  elasticsearch_version   = "6.4"
  instance_type           = "m4.large.elasticsearch"
  instance_count          = 6
  iam_actions             = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
  encrypt_at_rest_enabled = "false"
  kibana_subdomain_name   = "kibana-es"
  create_iam_service_linked_role = false
  ebs_volume_size         = 120

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}
