variable "vcns" {
  type = map(object({
    cidr_blocks = list(string)
    cmp         = string
  }))
}

variable "sls" {
  type = map(object({
    cmp = string
    vcn = string

    egress_security_rules  = optional(string)
    ingress_security_rules = optional(string)
  }))
}

variable "egress_security_rules" {
  type = map(list(object({
    destination      = string
    protocol         = string
    destination_type = string
    description      = optional(string)

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

variable "gws" {
  type = object({
    igws = map(object({
      cmp = string
      vcn = string
    }))

    drgs = map(object({
      cmp = string
    }))
  })

  default = {
    igws = null
    drgs = null
  }
}

variable "drg_attachments" {
  type = map(object({
    drg = string
    vcn = string
  }))

  default = null
}

variable "rts" {
  type = map(object({
    cmp         = string
    vcn         = string
    route_rules = optional(string)
  }))
}

variable "route_rules" {
  type = map(list(object({
    gw = string

    destination      = string
    destination_type = string

    description = optional(string)
  })))

  default = null
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    vcn        = string
    cmp        = string

    rt = optional(string)
    sl = optional(list(string))

    subnet_prohibit_public_ip_on_vnic = bool
  }))
}
