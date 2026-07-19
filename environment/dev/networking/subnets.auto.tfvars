subnets = {
  "flipkart_vcn1_public_subnet_key" = {
    cmp_key                           = "flipkart_dev_networking_cmp_key"
    display_name                      = "flipkart_vcn1_public_subnet"
    cidr_block                        = "10.0.1.0/24"
    vcn_key                           = "flipkart_vcn1_key"
    rt_key                            = "flipkart_vcn1_public_subnet_rt_key"
    sl_keys                           = ["flipkart_vcn1_public_subnet_sl_key"]
    subnet_prohibit_public_ip_on_vnic = false # Allows public IPs on this tier
  }
}