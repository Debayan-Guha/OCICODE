resource "oci_core_instance" "test_instance" {
  #Required
  availability_domain = var.instance_availability_domain
  compartment_id      = var.instance_compartment_id
  display_name        = var.instance_display_name
  shape               = var.instance_shape

  create_vnic_details {
    assign_public_ip = var.instance_create_vnic_details_assign_public_ip
    subnet_id        = var.instance_subnet_id
  }

  shape_config {
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
    ocpus         = var.instance_shape_config_ocpus
  }
  
  source_details {
    #Required
    source_id   = var.instance_source_id
    source_type = "image"

    #Optional
    boot_volume_size_in_gbs = var.instance_source_details_boot_volume_size_in_gbs
    boot_volume_vpus_per_gb = var.instance_source_details_boot_volume_vpus_per_gb
  }

  metadata = {
    ssh_authorized_keys = var.instance_ssh_public_key
  }
}
