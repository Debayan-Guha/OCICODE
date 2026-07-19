variable "vcns" {
  type = map(object({
    display_name = string
    cidr_blocks  = list(string)
    cmp_key      = string
  }))
}

variable "sls" {
  type = map(object({
    cmp_key      = string
    vcn_key      = string
    display_name = string

    egress_security_rules_key  = optional(string)
    ingress_security_rules_key = optional(string)
    }
    )
  )
}

variable "egress_security_rules" {
  type = map(list(object({
    destination      = string
    protocol         = string
    destination_type = string
    description      = optional(string)

    icmp_options = optional(object({
      type = string
    }))

    tcp_options = optional(object({

      destination_port_range = object({
        max = string
        min = string
      })

      source_port_range = optional(object({
        max = string
        min = string
      }))
    }))
  })))

  default = null
}

variable "ingress_security_rules" {
  type = map(list(object({
    source_type = string
    protocol    = string
    source      = string
    description = optional(string)

    icmp_options = optional(object({
      type = string
    }))

    tcp_options = optional(object({

      destination_port_range = object({
        max = string
        min = string
      })

      source_port_range = optional(object({
        max = string
        min = string
      }))
    }))
  })))

  default = null
}

variable "igws" {
  type = map(object({
    cmp_key      = string
    display_name = string
    vcn_key      = string
  }))
}

variable "rts" {
  type = map(object({
    cmp_key         = string
    vcn_key         = string
    display_name    = string
    route_rules_key = optional(string)
  }))
}

variable "route_rules" {
  type = map(list(object({
    gw_type = string
    gw_key  = string

    cidr_block       = string
    destination      = string
    destination_type = string

    description = optional(string)
  })))

  default = null
}

variable "subnets" {
  type = map(object({
    display_name = string
    cidr_block   = string
    vcn_key      = string
    cmp_key      = string

    rt_key  = optional(string)
    sl_keys = optional(list(string))

    subnet_prohibit_public_ip_on_vnic = bool
  }))
}
