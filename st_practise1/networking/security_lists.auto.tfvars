security_lists = {
  flipkart_vcn_web_subnet_sl = {
    security_list_compartment_key = "st_practise1_compartment"
    security_list_vcn_key         = "flipkart_vcn"

    security_list_egress_security_rules = [
      {
        destination      = "0.0.0.0/0"
        protocol         = "all"
        destination_type = "CIDR_BLOCK"
      }
    ]

    security_list_ingress_security_rules = [
      {
        protocol    = "6" # TCP
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
      },
      {
        protocol    = "1" # ICMP
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
      },
      {
        protocol    = "6" # ICMP
        source      = "49.37.36.46/32"
        source_type = "CIDR_BLOCK"
      }
    ]
  }

  flipkart_vcn_app_subnet_sl = {
    security_list_compartment_key = "st_practise1_compartment"
    security_list_vcn_key         = "flipkart_vcn"

    security_list_egress_security_rules = [
      {
        destination      = "10.0.3.0/24" # DB subnet
        protocol         = "all"
        destination_type = "CIDR_BLOCK"
      },
      {
        destination      = "0.0.0.0/0" # outbound (needs NAT/SGW route to work)
        protocol         = "all"
        destination_type = "CIDR_BLOCK"
      }
    ]

    security_list_ingress_security_rules = [
      {
        protocol    = "6" # TCP from web subnet
        source      = "10.0.1.0/24"
        source_type = "CIDR_BLOCK"
      },
      {
        protocol    = "1" # ICMP from VCN
        source      = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
      }
    ]
  }


  flipkart_vcn_db_subnet_sl = {
    security_list_compartment_key = "st_practise1_compartment"
    security_list_vcn_key         = "flipkart_vcn"

    security_list_egress_security_rules = [
      {
        destination      = "10.0.0.0/16" # VCN-internal only
        protocol         = "all"
        destination_type = "CIDR_BLOCK"
      }
    ]

    security_list_ingress_security_rules = [
      {
        protocol    = "6" # TCP from app subnet
        source      = "10.0.2.0/24"
        source_type = "CIDR_BLOCK"
      },
      {
        protocol    = "1" # ICMP from VCN
        source      = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
      }
    ]
  }
}