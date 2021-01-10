# This file contains variables for the EC2 module #


variable "region" {
  default = "us-east-1"
}

variable "ubuntu_account_number" {
  default = "099720109477"
}

variable "environment_tag" {
    default = "Kandula-PROD"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
  default = "XXX"
}


locals {
  cluster_name = "Kandula-PROD-${random_string.suffix.result}"
  k8s_service_account_namespace = "default"
  k8s_service_account_name      = "Kandula-PROD-sa"
  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

variable "kubernetes_version" {
  default = 1.18
  description = "kubernetes version"
}

