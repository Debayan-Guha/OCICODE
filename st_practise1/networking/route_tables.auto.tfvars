route_tables = {
  flipkart_vcn_rt = {
    route_table_compartment_key = "st_practise1_compartment"
    route_table_vcn_key         = "flipkart_vcn"

    route_rules = [
      {
        gw_key           = "flipkart_vcn_igw"
        destination      = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
      }
    ]
  }
}