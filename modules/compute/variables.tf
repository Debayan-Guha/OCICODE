variable "instance_availability_domain" {
  description = "The availability domain where the compute instance will be created."
  type        = string
}

variable "instance_compartment_id" {
  description = "The OCID of the compartment where the compute instance will be created."
  type        = string
}

variable "instance_display_name" {
  description = "A user-friendly name for the compute instance."
  type        = string
  default     = "test-compute-instance"
}

variable "instance_shape" {
  description = "The shape of the compute instance (e.g., VM.Standard.E5.Flex, VM.Standard.A1.Flex)."
  type        = string
  default     = "VM.Standard.E5.Flex"
}

variable "instance_create_vnic_details_assign_public_ip" {
  description = "Whether the primary VNIC should be assigned a public IP address."
  type        = bool
  default     = true
}

variable "instance_subnet_id" {
  type = string
}

variable "instance_shape_config_memory_in_gbs" {
  description = "The total amount of memory available to the instance, in gigabytes."
  type        = number
  default     = 12
}

variable "instance_shape_config_ocpus" {
  description = "The total number of OCPUs available to the instance."
  type        = number
  default     = 1
}

variable "instance_source_id" {
  description = "The OCID of the image used to boot the instance."
  type        = string
}

variable "instance_source_details_boot_volume_size_in_gbs" {
  description = "The size of the boot volume in GBs (minimum 50 GB in OCI)."
  type        = number
  default     = 50

  validation {
    condition     = var.instance_source_details_boot_volume_size_in_gbs >= 50
    error_message = "OCI boot volume size must be at least 50 GB."
  }
}

variable "instance_source_details_boot_volume_vpus_per_gb" {
  description = "The number of Volume Performance Units (VPUs) per GB (10 = Balanced, 20 = Higher Performance)."
  type        = number
  default     = 10
}

variable "instance_ssh_public_key" {
  description = "The SSH public key string used to access the instance."
  type        = string
}
