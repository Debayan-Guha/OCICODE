resource "oci_core_security_list" "security_list" {

  compartment_id = var.sl_cmp_id
  vcn_id         = var.sl_vcn_id

  display_name = var.sl_display_name

  dynamic "egress_security_rules" {

    for_each = var.egress_security_rules == null ? [] : var.egress_security_rules

    content {

      destination      = egress_security_rules.value.destination
      protocol         = egress_security_rules.value.protocol
      destination_type = egress_security_rules.value.destination_type

      description = egress_security_rules.value.description

      dynamic "icmp_options" {

        for_each = egress_security_rules.value.icmp_options == null ? [] : [egress_security_rules.value.icmp_options]

        content {
          type = icmp_options.value.type
        }

      }

      dynamic "tcp_options" {

        for_each = egress_security_rules.value.tcp_options == null ? [] : [egress_security_rules.value.tcp_options]

        content {
          max = tcp_options.value.destination_port_range.max
          min = tcp_options.value.destination_port_range.min

          dynamic "source_port_range" {

            for_each = tcp_options.value.source_port_range == null ? [] : [tcp_options.value.source_port_range]

            content {
              max = source_port_range.value.max
              min = source_port_range.value.min
            }

          }
        }

      }
    }
  }

  dynamic "ingress_security_rules" {

    for_each = var.ingress_security_rules == null ? [] : var.ingress_security_rules

    content {

      source_type = ingress_security_rules.value.source_type
      protocol    = ingress_security_rules.value.protocol
      source      = ingress_security_rules.value.source

      description = ingress_security_rules.value.description

      dynamic "icmp_options" {

        for_each = ingress_security_rules.value.icmp_options == null ? [] : [ingress_security_rules.value.icmp_options]

        content {
          type = icmp_options.value.type
        }
      }


      dynamic "tcp_options" {

        for_each = ingress_security_rules.value.tcp_options == null ? [] : [ingress_security_rules.value.tcp_options]

        content {

          max = tcp_options.value.destination_port_range.max
          min = tcp_options.value.destination_port_range.min

          dynamic "source_port_range" {

            for_each = tcp_options.value.source_port_range == null ? [] : [tcp_options.value.source_port_range]

            content {

              max = source_port_range.value.max
              min = source_port_range.value.min
            }
          }
        }
      }
    }
  }
}
