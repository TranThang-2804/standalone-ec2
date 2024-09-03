locals {
  name                 = try("${var.environment}_${var.name}", var.name)
  common_tags          = merge({ "Name" = local.name, "Environment" = var.environment }, var.tags)
  compressed_user_data = try(base64gzip(var.user_data), null)
  selected_user_data   = try(coalesce(var.user_data_base64, local.compressed_user_data), null) # NOTE: user_data_base64 overrides user_data
}
