variable "vcn_display_name" {
  type = string
}

variable "vcn_cidr_blocks" {
  type = list(string)
}

variable "vcn_cmp_id" {
  type = string
}

variable "vcn_dns_label" {
  type = string
  default = null
}