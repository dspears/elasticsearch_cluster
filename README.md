# AWS ElasticSearch Cluster, and Auto-scale Group with ELB

Example setup of an AWS ElasticSearch Cluster, along with a ELB load balanced auto-scale group of EC2 instances.

This makes use of the following open source Terraform modules:

- [Cloud Posse AWS ElasticSearch module](https://github.com/cloudposse/terraform-aws-elasticsearch) 
- [Terraform AWS Autoscaling](https://github.com/terraform-aws-modules/terraform-aws-autoscaling)
- [Terraform AWS ELB](https://github.com/terraform-aws-modules/terraform-aws-elb)

The AWS ElasticSearch cluster is configured in /elastic_search_cluster/main.tf.
The set of available parameters is described in the [Cloud Posse readme](https://github.com/cloudposse/terraform-aws-elasticsearch/blob/master/README.md)


The autoscale group is configured in /autoscale_group/main.tf.  Available parameters are described in the [Terraform AWS Autoscaling readme](https://github.com/terraform-aws-modules/terraform-aws-autoscaling/blob/master/README.md)

## Access to Kibana

With the ElasticSearch cluster setup for VPC access (as opposed to public access), Kibana is only directly accessible from
the VPC.  To allow access, I used an SSH tunnel, configured as follows in my ~/.ssh/config file:

```bash
# Elasticsearch Tunnel
Host estunnel
HostName 18.207.160.183
User ec2-user
IdentitiesOnly yes
IdentityFile ~/.ssh/id_rsa_vbox
LocalForward 9200 vpc-eg-dev-es-naq5cvupo45oznzd75tjxvmo6u.us-east-1.es.amazonaws.com:443
```

Another alternative for Kibana access would be to setup an authenticating proxy within the VPC.

## Usage:

### Create ElasticSearch Cluster:

- cd elastic_search_cluster
- Customize parameters in main.tf (e.g. vpc_id, subnet_ids, dns_zone_id, etc..)
- Configure Terraform S3 backend in remote.tf
- terraform init
- terraform apply

### Create Autoscale Group with ELB:

- cd autoscale_group
- Customize parameters in main.tf (e.g. min_size, max_size, desired_capacity, etc..)
- Configure Terraform S3 backend in remote.tf
- terraform init
- terraform apply
