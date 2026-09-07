ingress_security_rules = {
  # 1. Hub VCN Security List Rules
  "flipkart_dev_hub_public_subnet_sl_ingress_rules" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "45.123.14.67/32" # Laptop public IP
      protocol    = "6"               # TCP
      description = "Allow SSH access from the administrator laptop."
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
      description = "Allow ICMP traffic from the administrator laptop for network troubleshooting."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "0.0.0.0/0" # Internet
      protocol    = "6"         # TCP
      description = "Allow inbound HTTP traffic from the Internet to the public Load Balancer."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    }
  ],
  "flipkart_dev_spoke1_vcn_web_private_subnet_sl_ingress_rules" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "1"           # ICMP
      description = "Allow ICMP traffic from the Hub VCN to the Web private subnet for network troubleshooting."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "6"           # TCP
      description = "Allow SSH access from the Hub VCN to Web servers for administration."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/25" # Hub public subnet where Load Balancer resides
      protocol    = "6"           # TCP
      description = "Allow HTTP traffic from the Hub Load Balancer to Web servers."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    }
  ],
  "flipkart_dev_spoke1_vcn_app_private_subnet_sl_ingress_rules" = [
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.1.0/26" # Web private subnet
      protocol    = "1"           # ICMP
      description = "Allow ICMP traffic from the Web private subnet to the App private subnet for network troubleshooting."
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.0.0/24" # Hub VCN
      protocol    = "6"           # TCP
      description = "Allow SSH access from the Hub VCN to App servers for administration."
      tcp_options = {
        destination_port_range = {
          min = "22"
          max = "22"
        }
      }
    },
    {
      source_type = "CIDR_BLOCK"
      source      = "10.0.1.0/26" # Web private subnet
      protocol    = "6"           # TCP
      description = "Allow application traffic from Web servers to App servers."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
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
      destination      = "10.0.1.0/24" # Spoke1 VCN
      protocol         = "1"           # ICMP
      description      = "Allow ICMP traffic from the Hub public subnet to Spoke1 VCN for network troubleshooting."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.0/24" # Spoke1 VCN
      protocol         = "6"           # TCP
      description      = "Allow SSH access from the Hub public subnet to servers in Spoke1 VCN for administration."
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
      description      = "Allow outbound Internet traffic from resources in the Hub public subnet."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.0/24" # Spoke1 VCN
      protocol         = "6"           # TCP
      description      = "Allow HTTP traffic from the Hub Load Balancer to Web servers in Spoke1 VCN."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    }
  ],
  "flipkart_dev_spoke1_vcn_web_private_subnet_sl_egress_rules" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.64/27" # App private subnet
      protocol         = "6"            # TCP
      description      = "Allow HTTP traffic from Web servers to App servers."
      tcp_options = {
        destination_port_range = {
          min = "80"
          max = "80"
        }
      }
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "1" # ICMP
      description      = "Allow ICMP traffic from Web servers to external destinations for network troubleshooting."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "6" # TCP
      description      = "Allow outbound TCP traffic from Web servers to external destinations through the NAT Gateway."
    }
  ],
  "flipkart_dev_spoke1_vcn_app_private_subnet_sl_egress_rules" = [
    {
      destination_type = "CIDR_BLOCK"
      destination      = "10.0.1.96/27" # DB private subnet
      protocol         = "6"            # TCP
      description      = "Allow MySQL database traffic from App servers to DB servers."
      tcp_options = {
        destination_port_range = {
          min = "3306"
          max = "3306"
        }
      }
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "1" # ICMP
      description      = "Allow ICMP traffic from App servers to external destinations for network troubleshooting."
    },
    {
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      protocol         = "6" # TCP
      description      = "Allow outbound TCP traffic from App servers to external destinations through the NAT Gateway."
    }
  ]
}
