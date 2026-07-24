sls = {
  "flipkart_spoke1_vcn1_app_private_subnet1_sl_key" = {
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_spoke1_vcn1_app_private_subnet1_sl"
    vcn_key      = "flipkart_spoke1_vcn1_key"
    egress_security_rules_key  = "flipkart_spoke1_vcn1_app_private_subnet1_sl_egress_rules_key"
    ingress_security_rules_key = "flipkart_spoke1_vcn1_app_private_subnet1_sl_ingress_rules_key"
  }
}