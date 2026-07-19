subnets = {
  "flipkart_spoke1_vcn1_app_private_subnet1_key" = {
    cmp_key                           = "flipkart_dev_networking_cmp_key"
    display_name                      = "flipkart_spoke1_vcn1_app_private_subnet1"
    cidr_block                        = "10.0.1.0/26"
    vcn_key                           = "flipkart_spoke1_vcn1_key"
    rt_key                            = "flipkart_spoke1_vcn1_private_subnet_rt_key"
    sl_keys                           = ["flipkart_spoke1_vcn1_app_private_subnet1_sl_key"]
    subnet_prohibit_public_ip_on_vnic = true 
  }
}