variable "instances" {
  type = map(object({
    instance_display_name             = string
    instance_availability_domain_key = string
    instance_cmp_key                 = string
    instance_assign_public_ip         = bool
    instance_subnet_key               = string
    instance_memory_in_gbs            = number
    instance_ocpus                    = number
    instance_boot_volume_size_in_gbs  = number
    instance_image_id = string
  }))
  description = "Strongly typed public compute instances metadata configuration."
}