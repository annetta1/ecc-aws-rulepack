terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws"{
  profile = var.profile
  region  = var.default-region
  
  default_tags {
    tags = {
      CustodianRule    = "ecc-aws-110-security-group-ingress-is-restricted_traffic_to_dns_port_53"
      ComplianceStatus = "Green"
    }
  }
}