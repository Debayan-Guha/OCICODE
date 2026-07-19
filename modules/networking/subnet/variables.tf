variable "subnet_cidr_block" {
  type = string
}

variable "subnet_cmp_id" {
  type = string
}

variable "subnet_vcn_id" {
  type = string
}

variable "subnet_display_name" {
  type = string
}

variable "subnet_route_table_id" {
  type    = string
  default = null
}

variable "subnet_security_list_ids" {
  type    = list(string)
  default = null
}

variable "subnet_prohibit_public_ip_on_vnic" {
  type = bool
}
