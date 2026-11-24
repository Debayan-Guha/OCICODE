resource "oci_core_security_list" "test_security_list" {
  
  compartment_id = var.security_list_compartment_id
  vcn_id         = var.security_list_vcn_id
  display_name   = var.security_list_display_name

  dynamic "egress_security_rules" {

    for_each = var.security_list_egress_security_rules == null  ? [] : var.security_list_egress_security_rules

    content {
      
      destination = egress_security_rules.value.destination
      protocol    = egress_security_rules.value.protocol

      destination_type = egress_security_rules.value.destination_type
    }
  }

  dynamic "ingress_security_rules" {

    for_each = var.security_list_ingress_security_rules == null ? [] : var.security_list_ingress_security_rules

    content {
      
      protocol = ingress_security_rules.value.protocol
      source   = ingress_security_rules.value.source

      source_type = ingress_security_rules.value.source_type
    }
  }
}
