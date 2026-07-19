variable "rt_cmp_id" {
  type = string
}

variable "rt_vcn_id" {
  type = string
}

variable "rt_display_name" {
  type = string
}

variable "route_rules" {
  type = list(object({
    network_entity_id = string
    cidr_block        = string
    destination       = string
    destination_type  = string

    description = optional(string)
  }))
}