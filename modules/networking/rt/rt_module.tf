resource "oci_core_route_table" "route_table" {

  compartment_id = var.rt_cmp_id
  vcn_id         = var.rt_vcn_id
  display_name   = var.rt_display_name

  dynamic "route_rules" {

    for_each = var.route_rules == null ? [] : var.route_rules

    content {

      network_entity_id = route_rules.value.network_entity_id
      destination       = route_rules.value.destination
      destination_type  = route_rules.value.destination_type

      description = route_rules.value.description

    }
  }
}