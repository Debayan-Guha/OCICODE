vcns = {
  "flipkart_dev_hub_vcn_key" = {
    cidr_blocks  = ["10.0.0.0/24"]
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_hub_vcn"
  }

  "flipkart_dev_spoke1_vcn1_key" = {
    cidr_blocks  = ["10.0.1.0/24"]
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_spoke1_vcn1"
  }
}

rts = {
  "flipkart_dev_hub_private_subnet_rt_key" = {
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_hub_private_subnet_rt"
    vcn_key      = "flipkart_dev_hub_vcn_key"
  }

  "flipkart_dev_spoke1_vcn1_private_subnet_rt_key" = {
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_spoke1_vcn1_private_subnet_rt"
    vcn_key      = "flipkart_dev_spoke1_vcn1_key"
  }
}

sls = {
  "flipkart_dev_hub_private_subnet_sl_key" = {
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_hub_private_subnet_sl"
    vcn_key      = "flipkart_dev_hub_vcn_key"

    egress_security_rules_key  = "flipkart_dev_hub_private_subnet_sl_egress_rules_key"
    ingress_security_rules_key = "flipkart_dev_hub_private_subnet_sl_ingress_rules_key"
  }

  "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_key" = {
    cmp_key      = "flipkart_dev_networking_cmp_key"
    display_name = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl"
    vcn_key      = "flipkart_dev_spoke1_vcn1_key"

    egress_security_rules_key  = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_egress_rules_key"
    ingress_security_rules_key = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_ingress_rules_key"
  }
}

subnets = {
  "flipkart_dev_hub_private_subnet_key" = {
    cmp_key                           = "flipkart_dev_networking_cmp_key"
    display_name                      = "flipkart_dev_hub_private_subnet"
    cidr_block                        = "10.0.0.0/24"
    vcn_key                           = "flipkart_dev_hub_vcn_key"
    rt_key                            = "flipkart_dev_hub_private_subnet_rt_key"
    sl_keys                           = ["flipkart_dev_hub_private_subnet_sl_key"]
    subnet_prohibit_public_ip_on_vnic = true
  }

  "flipkart_dev_spoke1_vcn1_app_private_subnet1_key" = {
    cmp_key                           = "flipkart_dev_networking_cmp_key"
    display_name                      = "flipkart_dev_spoke1_vcn1_app_private_subnet1"
    cidr_block                        = "10.0.1.0/26"
    vcn_key                           = "flipkart_dev_spoke1_vcn1_key"
    rt_key                            = "flipkart_dev_spoke1_vcn1_private_subnet_rt_key"
    sl_keys                           = ["flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_key"]
    subnet_prohibit_public_ip_on_vnic = true
  }
}