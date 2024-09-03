resource "aws_key_pair" "pubkey" {
  count = try(var.create_new_key, false) && try(var.pubkey, null) != null ? 1 : 0

  key_name_prefix = "${local.name}_"
  public_key      = var.pubkey
  tags            = local.common_tags
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = try(var.associate_public_ip, false)
  key_name                    = var.create_new_key ? aws_key_pair.pubkey[0].key_name : try(var.key_pair_name, null)
  monitoring                  = try(var.detailed_monitoring, false)
  iam_instance_profile        = try(aws_iam_instance_profile.this[0].name, null)
  user_data_base64            = local.selected_user_data
  ebs_optimized               = true
  root_block_device {
    encrypted   = var.encrypt_volumes
    kms_key_id  = var.ebs_key_id
    iops        = var.root_volume_iops
    throughput  = var.root_volume_throughput
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      encrypted   = var.encrypt_volumes
      kms_key_id  = var.ebs_key_id
      device_name = ebs_block_device.value.device_name
      iops        = try(ebs_block_device.value.iops, null)
      throughput  = try(ebs_block_device.value.throughput, null)
      volume_size = try(ebs_block_device.value.volume_size, null)
      volume_type = try(ebs_block_device.value.volume_type, null)
    }
  }
  metadata_options {
    http_tokens = "required"
  }
  volume_tags = merge(local.common_tags, var.volume_tags)
  tags        = merge(local.common_tags, var.instance_tags)
}

resource "aws_eip_association" "this" {
  count = try(var.eip_id, null) != null ? 1 : 0

  instance_id   = aws_instance.this.id
  allocation_id = var.eip_id
}

resource "aws_iam_instance_profile" "this" {
  count = try(var.iam_role_name, null) != null ? 1 : 0

  name_prefix = "${local.name}_"
  role        = var.iam_role_name
  tags        = local.common_tags
}
