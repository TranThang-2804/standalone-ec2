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
  region = "ap-southeast-1"
}

module "aws_standalone_ec2" {
  source         = "../.."
  name           = "test_instance"
  environment    = "dut"
  instance_type  = "t3.nano"
  ami_id         = "ami-01811d4912b4ccb26"
  subnet_id      = "subnet-0594464923190c112"
  create_new_key = true
  pubkey         = file("./pub_key.pub")
}

output "aws_standalone_ec2" {
  value = module.aws_standalone_ec2
}
