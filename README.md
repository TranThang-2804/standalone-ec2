# AWS Standalone EC2

This is a Terraform template for a standalone AWS EC2 instance.

A Key Pair will be created with the provided SSH public key. Optionally, an EIP and IAM Role may be attached, creating an EIP Association and a IAM Instance Profile.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.61.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.pubkey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for launching this instance | `string` | n/a | yes |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Whether to assign a public IP | `bool` | `false` | no |
| <a name="input_create_new_key"></a> [create\_new\_key](#input\_create\_new\_key) | Whether to create a new key pair | `bool` | `false` | no |
| <a name="input_detailed_monitoring"></a> [detailed\_monitoring](#input\_detailed\_monitoring) | Enable detailed monitoring for the instance | `bool` | `false` | no |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | List of extra EBS volumes to attach (see ebs\_block\_device on aws\_instance) | `list(any)` | `[]` | no |
| <a name="input_ebs_key_id"></a> [ebs\_key\_id](#input\_ebs\_key\_id) | ARN of KMS key to use for EBS encryption | `string` | `null` | no |
| <a name="input_eip_id"></a> [eip\_id](#input\_eip\_id) | Allocation ID of Elastic IP to associate with | `string` | `null` | no |
| <a name="input_encrypt_volumes"></a> [encrypt\_volumes](#input\_encrypt\_volumes) | Whether to encrypt EBS volumes | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment to deploy to (for tagging) | `string` | `null` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of IAM Role to use as instance role | `string` | `null` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | Tags to apply to the instance | `map(string)` | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to launch | `string` | n/a | yes |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Name of existing key pair to use | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of instance | `string` | n/a | yes |
| <a name="input_pubkey"></a> [pubkey](#input\_pubkey) | Public key for new key pair | `string` | `null` | no |
| <a name="input_root_volume_iops"></a> [root\_volume\_iops](#input\_root\_volume\_iops) | Provisioned IOPS for root volume (provisioned volume types only) | `number` | `null` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root volume size in GiB | `number` | `null` | no |
| <a name="input_root_volume_throughput"></a> [root\_volume\_throughput](#input\_root\_volume\_throughput) | Provisioned throughput for root volume (provisioned volume types only) | `number` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Type of EBS volume for the root volume | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of subnet to place primary ENI in | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to each resource | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data in plain text; overridden by user\_data\_base64 | `string` | `null` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | User data in base64; overrides user\_data | `string` | `""` | no |
| <a name="input_volume_tags"></a> [volume\_tags](#input\_volume\_tags) | Tags to apply to EBS volumes | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ebs_volume_ids"></a> [ebs\_volume\_ids](#output\_ebs\_volume\_ids) | Map of device name to volume ID of additional EBS devices |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | Instance ID |
| <a name="output_instance_state"></a> [instance\_state](#output\_instance\_state) | State of the instance |
| <a name="output_ipv6_addrs"></a> [ipv6\_addrs](#output\_ipv6\_addrs) | IPv6 addresses assigned to instance |
| <a name="output_key_pair_name"></a> [key\_pair\_name](#output\_key\_pair\_name) | Key name of login keypair |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | Private DNS name |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP address |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | Public DNS name |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP assigned to instance |
| <a name="output_root_volume_id"></a> [root\_volume\_id](#output\_root\_volume\_id) | Volume ID of root block device |
<!-- END_TF_DOCS -->

## Tests

### Manual tests

- `examples/simple` - A simple EC2 configuration

Copy the entire example into `tests/` and run `terraform init` there:

```bash
mkdir -p tests/
cp -r examples/simple tests/
cd tests/simple/
terraform init
```

## Author

Written by Samudra, August 2024.
