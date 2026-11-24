resource "oci_core_route_table" "test_route_table" {

  compartment_id = var.route_table_compartment_id
  vcn_id         = var.route_table_vcn_id
  display_name   = var.route_table_display_name

  dynamic "route_rules" {

    for_each = var.route_rules == null ? [] : var.route_rules

    content {
      network_entity_id = route_rules.value.network_entity_id

      destination      = route_rules.value.destination
      destination_type = route_rules.value.destination_type
    }
  }
}
