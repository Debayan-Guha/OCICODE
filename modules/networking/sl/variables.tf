variable "sl_cmp_id" {
  type = string
}

variable "sl_vcn_id" {
  type = string
}

variable "sl_display_name" {
  type = string
}

variable "egress_security_rules" {
  type = list(object({
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
  }))

  default = []
}

variable "ingress_security_rules" {
  type = list(object({
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
  }))

  default = []
}
