terraform {
  required_version = ">= 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0"
    }
  }
}

provider "aws" {
  region = local.region
}

data "aws_availability_zones" "zones" {}

locals {
  region = "ap-southeast-1"
  name   = "simple_test"

  cidr          = "10.11.0.0/16"
  az            = data.aws_availability_zones.zones.names[0]
  instance_type = "t3.nano"
  pubkey_file   = "~/.ssh/id_ed25519.pub"
}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "~> 5.0"
  name            = local.name
  azs             = [local.az]
  cidr            = local.cidr
  private_subnets = [cidrsubnet(local.cidr, 4, 0)]
  tags            = { "Name" = "${local.name}_vpc", Environment = "dev" }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

module "aws_standalone_ec2" {
  source         = "../.."
  name           = "${local.name}_instance"
  environment    = "dut"
  instance_type  = local.instance_type
  ami_id         = data.aws_ami.ubuntu.id
  subnet_id      = module.vpc.private_subnets[0]
  create_new_key = true
  pubkey         = file(pathexpand(local.pubkey_file))
}

output "aws_standalone_ec2" {
  value = module.aws_standalone_ec2
}
