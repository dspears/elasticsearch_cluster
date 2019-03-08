# AWS ElasticSearch Cluster, and Auto-scale Group with ELB

Example setup of an AWS ElasticSearch Cluster, along with a ELB load balanced auto-scale group of EC2 instances.

This makes use of the following open source Terraform modules:

- [Cloud Posse AWS ElasticSearch module](https://github.com/cloudposse/terraform-aws-elasticsearch) 
- [Terraform AWS Autoscaling](https://github.com/terraform-aws-modules/terraform-aws-autoscaling)
- [Terraform AWS ELB](https://github.com/terraform-aws-modules/terraform-aws-elb)

The AWS ElasticSearch cluster is configured in /elastic_search_cluster/main.tf.
The set of available parameters is described in the [Cloud Posse readme](https://github.com/cloudposse/terraform-aws-elasticsearch/blob/master/README.md)


The autoscale group is configured in /autoscale_group/main.tf.  Available parameters are described in the [Terraform AWS Autoscaling readme](https://github.com/terraform-aws-modules/terraform-aws-autoscaling/blob/master/README.md)

## Usage:

### Create ElasticSearch Cluster:

- cd elastic_search_cluster
- Customize parameters in main.tf (e.g. vpc_id, subnet_ids, dns_zone_id, etc..)
- terraform init
- terraform apply

### Create Autoscale Group with ELB:

- cd autoscale_group
- Customize parameters in main.tf (e.g. min_size, max_size, desired_capacity, etc..)
- terraform init
- terraform apply