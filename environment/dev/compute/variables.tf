variable "instances" {
  type = map(object({
    instance_availability_domain     = string
    instance_cmp                     = string
    instance_assign_public_ip        = bool
    instance_subnet                  = string
    instance_memory_in_gbs           = number
    instance_ocpus                   = number
    instance_boot_volume_size_in_gbs = number
    instance_image_id                = string
  }))
  description = "Strongly typed public compute instances metadata configuration."
}
