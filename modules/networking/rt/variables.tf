variable "route_table_compartment_id" {
  type = string
}

variable "route_table_vcn_id" {
  type = string
}

variable "route_table_display_name" {
  type = string
}

variable "route_rules" {
  type = list(object({
    network_entity_id = string
    destination=string
    destination_type=string

  }))
}