variable "instance_availability_domain" {
  type        = string
  description = "The availability domain for the instance"
}

variable "instance_cmp_id" {
  type        = string
  description = "The OCID of the compartment where the instance will be created"
}

variable "instance_assign_public_ip" {
  type        = bool
  description = "Whether to assign a public IP to the instance"
}

variable "instance_subnet_id" {
  type        = string
  description = "The OCID of the subnet where the instance will be attached"
}

variable "instance_display_name" {
  type        = string
  description = "The display name for the instance"
}

variable "instance_ssh_authorized_keys" {
  type        = string
  description = "The SSH public keys to be injected into the instance"
}

variable "instance_memory_in_gbs" {
  type        = number
  description = "Memory in GB for the instance"
}

variable "instance_ocpus" {
  type        = number
  description = "Number of OCPUs for the instance"
}

variable "instance_boot_volume_size_in_gbs" {
  type        = number
  default     = 50
  description = "Boot volume size in GB"
}

variable "instance_source_id" {
  type        = string
  description = "The OCID of the image used to boot the instance"
}