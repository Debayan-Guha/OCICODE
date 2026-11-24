variable "security_list_compartment_id" {
  type = string
}

variable "security_list_vcn_id" {
  type = string
}

variable "security_list_display_name" {
  type = string
}

variable "security_list_egress_security_rules" {
  type = list(object({
    destination      = string
    protocol         = string
    destination_type = string
  }))
}

variable "security_list_ingress_security_rules" {
  type = list(object({
    source      = string
    protocol    = string
    source_type = string
  }))
}
