output "instance_id" {
  value       = aws_instance.this.id
  description = "Instance ID"
}

output "instance_state" {
  value       = aws_instance.this.instance_state
  description = "State of the instance"
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP assigned to instance"
}

output "public_dns" {
  value       = aws_instance.this.public_dns
  description = "Public DNS name"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address"
}

output "private_dns" {
  value       = aws_instance.this.private_dns
  description = "Private DNS name"
}

output "ipv6_addrs" {
  value       = aws_instance.this.ipv6_addresses
  description = "IPv6 addresses assigned to instance"
}

output "key_pair_name" {
  value       = try(aws_instance.this.key_name, null)
  description = "Key name of login keypair"
}

output "root_volume_id" {
  value       = one(aws_instance.this.root_block_device).volume_id
  description = "Volume ID of root block device"
}

output "ebs_volume_ids" {
  value       = { for v in aws_instance.this.ebs_block_device : v.device_name => v.volume_id }
  description = "Map of device name to volume ID of additional EBS devices"
}
