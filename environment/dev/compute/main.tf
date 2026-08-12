module "compute" {
  source = "../../../modules/compute"

  for_each = var.instances

  instance_availability_domain = local.availability_domain_ids[each.value.instance_availability_domain_key]

  instance_cmp_id = local.compartment_ids[each.value.instance_cmp_key]

  instance_assign_public_ip = each.value.instance_assign_public_ip
  instance_subnet_id        = local.subnet_ids[each.value.instance_subnet_key].id

  instance_display_name = each.value.instance_display_name

  instance_ssh_authorized_keys = file("/home/debayan/Desktop/OCICODE/secrets/vm_public_key.pub")

  instance_memory_in_gbs           = each.value.instance_memory_in_gbs
  instance_ocpus                   = each.value.instance_ocpus
  instance_boot_volume_size_in_gbs = each.value.instance_boot_volume_size_in_gbs
  
  instance_source_id = each.value.instance_image_id

}