ingress_security_rules = {
  "flipkart_spoke1_vcn1_app_private_subnet1_sl_ingress_rules_key" = [

    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24"
      protocol    = "1"

      description = "Allow ICMP from Hub VCN."

      # Optional: omit to allow all ICMP types
      icmp_options = {
        type = "8"
      }
    },

    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24"
      protocol    = "6"

      description = "Allow SSH from Hub VCN."

      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    }
  ]
}

egress_security_rules = {
  "flipkart_spoke1_vcn1_app_private_subnet1_sl_egress_rules_key" = [

    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24"
      protocol         = "1"

      description = "Allow ICMP to Hub VCN."

      # Optional: omit to allow all ICMP types
      icmp_options = {
        type = "0"
      }
    },

    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24"
      protocol         = "6"

      description = "Allow SSH from app VCN."

      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    }
  ]
}