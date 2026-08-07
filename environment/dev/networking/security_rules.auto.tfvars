ingress_security_rules = {

  # 1. Hub VCN Security List Rules
  "flipkart_dev_hub_private_subnet_sl_ingress_rules_key" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.1.0/24" # Traffic coming from Spoke1 VCN
      protocol    = "1"          # ICMP

      description = "Allow ICMP Ping from Spoke1 VCN."

      icmp_options = {
        type = 8
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.1.0/24" # Traffic coming from Spoke1 VCN
      protocol    = "6"          # TCP

      description = "Allow SSH from Spoke1 VCN."

      tcp_options = {
        destination_port_range = {
          min = 22
          max = 22
        }
      }
    }
  ],

  # 2. Spoke1 VCN Security List Rules
  "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_ingress_rules_key" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Traffic coming from Hub VCN
      protocol    = "1"          # ICMP

      description = "Allow ICMP Ping from Hub VCN."

      icmp_options = {
        type = 8
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Traffic coming from Hub VCN
      protocol    = "6"          # TCP

      description = "Allow SSH from Hub VCN."

      tcp_options = {
        destination_port_range = {
          min = 22
          max = 22
        }
      }
    }
  ]

}

egress_security_rules = {

  # 1. Hub VCN Security List Rules
  "flipkart_dev_hub_private_subnet_sl_egress_rules_key" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.0/24" # Traffic going to Spoke1 VCN
      protocol         = "1"          # ICMP

      description = "Allow ICMP Ping to Spoke1 VCN."

      icmp_options = {
        type = 8
      }
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.0/24" # Traffic going to Spoke1 VCN
      protocol         = "6"          # TCP

      description = "Allow SSH to Spoke1 VCN."

      tcp_options = {
        destination_port_range = {
          min = 22
          max = 22
        }
      }
    }
  ],

  # 2. Spoke1 VCN Security List Rules
  "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_egress_rules_key" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24" # Traffic going to Hub VCN
      protocol         = "1"          # ICMP

      description = "Allow ICMP Ping to Hub VCN."

      icmp_options = {
        type = 8
      }
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24" # Traffic going to Hub VCN
      protocol         = "6"          # TCP

      description = "Allow SSH to Hub VCN."

      tcp_options = {
        destination_port_range = {
          min = 22
          max = 22
        }
      }
    }
  ]

}