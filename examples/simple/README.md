# Simple example

Creates a standalone EC2 instance inside a new VPC.

Pubkey authentication will be set up from your `~/.ssh/id_ed25519.pub`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_standalone_ec2"></a> [aws\_standalone\_ec2](#module\_aws\_standalone\_ec2) | ../.. | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_standalone_ec2"></a> [aws\_standalone\_ec2](#output\_aws\_standalone\_ec2) | n/a |
<!-- END_TF_DOCS -->
