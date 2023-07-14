resource "aws_security_group" "opensg" {
name = "${terraform.workspace}-opensearch-sg"
vpc_id = var.vpc_id


ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["172.0.0.0/16"]
}


egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}


resource "aws_opensearch_domain" "opensearch" {
  domain_name = "${terraform.workspace}-domain"
#   engine_version = "Elasticsearch_7.10"
  engine_version = "OpenSearch_2.7"

    advanced_options = {}

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = "admin"
      master_user_password = "xxxxx"
    }
  }
  
  vpc_options {
    subnet_ids         = [element(var.private_subnets, 0)]
    security_group_ids = [aws_security_group.opensg.id]
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_options_volume_size
    volume_type = var.ebs_options_volume_type

  }

  encrypt_at_rest {
    enabled    = true
  }


  cluster_config {
    instance_count           = var.instance_count
    instance_type            = var.instance_type
    dedicated_master_enabled = false
    zone_awareness_enabled   = false
    warm_enabled             = false
    
  }
domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    }

  node_to_node_encryption {
    enabled = true
  }

  tags = {
    # Name = var.tag_name
    Name = "${terraform.workspace}-opensearch"
     }
}