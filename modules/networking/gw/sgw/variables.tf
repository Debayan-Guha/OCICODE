variable "sgw_cmp_id" {
  description = "Compartment OCID for the Service Gateway"
  type        = string
}

variable "sgw_vcn_id" {
  description = "VCN OCID where the Service Gateway will be created"
  type        = string
}

variable "sgw_display_name" {
  description = "Display name for the Service Gateway"
  type        = string
}

variable "sgw_service_id" {
  description = "Service ID for the Service Gateway (e.g., Object Storage)"
  type        = string
}