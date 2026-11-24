subnets = {
  flipkart_vcn_web_subnet = {
    subnet_compartment_key            = "st_practise1_compartment"
    subnet_vcn_key                    = "flipkart_vcn"
    subnet_cidr_block                 = "10.0.1.0/24"
    subnet_prohibit_public_ip_on_vnic = false
    subnet_route_table_key            = "flipkart_vcn_rt"
    subnet_security_list_keys         = ["flipkart_vcn_web_subnet_sl"]
  }

  flipkart_vcn_app_subnet = {
    subnet_compartment_key            = "st_practise1_compartment"
    subnet_vcn_key                    = "flipkart_vcn"
    subnet_cidr_block                 = "10.0.2.0/24"
    subnet_prohibit_public_ip_on_vnic = true
    subnet_route_table_key            = "flipkart_vcn_rt"
    subnet_security_list_keys         = ["flipkart_vcn_app_subnet_sl"]
  }

  flipkart_vcn_db_subnet = {
    subnet_compartment_key            = "st_practise1_compartment"
    subnet_vcn_key                    = "flipkart_vcn"
    subnet_cidr_block                 = "10.0.3.0/24"
    subnet_prohibit_public_ip_on_vnic = true
    subnet_route_table_key            = "flipkart_vcn_rt"
    subnet_security_list_keys         = ["flipkart_vcn_db_subnet_sl"]
  }
}