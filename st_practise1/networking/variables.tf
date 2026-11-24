variable "vcns" {
  type = map(object({
    vcn_compartment_key = string
    vcn_cidr_block      = string
  }))

}

variable "security_lists" {

  type = map(object({
    security_list_compartment_key = string
    security_list_vcn_key         = string

    security_list_egress_security_rules = optional(list(object({
      destination      = string
      protocol         = string
      destination_type = string
    })))

    security_list_ingress_security_rules = optional(list(object({
      protocol    = string
      source      = string
      source_type = string
    })))
  }))

}

variable "route_tables" {
  type = map(object({
    route_table_compartment_key = string
    route_table_vcn_key         = string

    route_rules = optional(list(object({
      gw_key           = string
      destination      = string
      destination_type = string

    })))
  }))
}

variable "igws" {
  type = map(object({
    igw_compartment_key = string
    igw_vcn_key         = string
  }))
}

variable "subnets" {
  type = map(object({
    subnet_compartment_key            = string
    subnet_vcn_key                    = string
    subnet_cidr_block                 = string
    subnet_prohibit_public_ip_on_vnic = bool
    subnet_route_table_key            = string
    subnet_security_list_keys         = list(string)
  }))
}
