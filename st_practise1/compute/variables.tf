variable "instances" {
  type = map(object({
    instance_availability_domain                    = string
    instance_compartment_key                        = string
    instance_shape                                  = string
    instance_subnet_key                             = string
    instance_source_id                              = string
    instance_create_vnic_details_assign_public_ip   = optional(bool)
    instance_shape_config_memory_in_gbs             = optional(number)
    instance_shape_config_ocpus                     = optional(number)
    instance_source_details_boot_volume_size_in_gbs = optional(number)
    instance_source_details_boot_volume_vpus_per_gb = optional(number)
    instance_ssh_public_key                         = optional(string)
  }))
}
