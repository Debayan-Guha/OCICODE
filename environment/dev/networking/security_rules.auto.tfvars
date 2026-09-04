ingress_security_rules = {
  # 1. Hub VCN Security List Rules
  "flipkart_dev_hub_public_subnet_sl_ingress_rules" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/16" # All Spoke VCNs
      protocol    = "1"           # ICMP
      description = "Allow ICMP from Spoke VCNs."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/16" # All Spoke VCNs
      protocol    = "6"           # TCP
      description = "Allow SSH from Spoke VCNs."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "45.123.14.67/32" # Laptop public IP
      protocol    = "6"               # TCP
      description = "Allow SSH from my laptop."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "45.123.14.67/32" # Laptop public IP
      protocol    = "1"               # ICMP
      description = "Allow ICMP from my laptop."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "0.0.0.0/0" # All internet traffic
      protocol    = "6"         # TCP
      description = "Allow HTTP traffic from internet to Load Balancer."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    }
  ],
  # 2. Spoke1 VCN Security List Rules
  "flipkart_dev_spoke1_vcn_app_private_subnet_sl_ingress_rules" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "1"           # ICMP
      description = "Allow ICMP from Hub VCN."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "6"           # TCP
      description = "Allow SSH from Hub VCN."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "6"           # TCP
      description = "Allow SSH from Hub VCN."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # <-- Your Hub Subnet CIDR (where the LB is)
      protocol    = "6"           # TCP
      description = "Allow HTTP traffic from Hub Load Balancer on port 80"
      tcp_options = {
        destination_port_range = {
          min = 80
          max = 80
        }
      }
    }
  ]
}

egress_security_rules = {
  # 1. Hub VCN Security List Rules
  "flipkart_dev_hub_public_subnet_sl_egress_rules" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/16" # All Spoke VCNs
      protocol         = "1"           # ICMP
      description      = "Allow ICMP to Spoke VCNs."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/16" # All Spoke VCNs
      protocol         = "6"           # TCP
      description      = "Allow SSH to Spoke VCNs."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    # Internet
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "all"
      description      = "Allow outbound Internet access."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/16" # All Spoke VCNs
      protocol         = "6"           # TCP
      description      = "Allow HTTP (port 80) from Load Balancer to Spoke VCNs."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    }
  ],
  # 2. Spoke1 VCN Security List Rules
  "flipkart_dev_spoke1_vcn_app_private_subnet_sl_egress_rules" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24" # Hub VCN
      protocol         = "1"           # ICMP
      description      = "Allow ICMP to Hub VCN."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.0.0/24" # Hub VCN
      protocol         = "6"           # TCP
      description      = "Allow SSH to Hub VCN."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "1"
      description      = "Allow ICMP to Internet (Outside)"
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "6"
      description      = "Download anything from internet"
    }
  ]
}
