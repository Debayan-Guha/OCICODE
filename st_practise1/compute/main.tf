module "instance" {
  source   = "../../modules/compute"
  for_each = var.instances

  instance_availability_domain                    = each.value.instance_availability_domain
  instance_compartment_id                         = local.compartment_ids[each.value.instance_compartment_key]
  instance_display_name                           = each.key
  instance_shape                                  = each.value.instance_shape
  instance_subnet_id                              = local.subnet_ids[each.value.instance_subnet_key].id
  instance_source_id                              = each.value.instance_source_id
  instance_create_vnic_details_assign_public_ip   = each.value.instance_create_vnic_details_assign_public_ip
  instance_shape_config_memory_in_gbs             = each.value.instance_shape_config_memory_in_gbs
  instance_shape_config_ocpus                     = each.value.instance_shape_config_ocpus
  instance_source_details_boot_volume_size_in_gbs = each.value.instance_source_details_boot_volume_size_in_gbs
  instance_source_details_boot_volume_vpus_per_gb = each.value.instance_source_details_boot_volume_vpus_per_gb
  instance_ssh_public_key                         = file(each.value.instance_ssh_public_key)
}
