vcns = {
  "flipkart_dev_hub_vcn_key" = {
    cidr_blocks  = ["10.0.0.0/24"]
    cmp_key      = "flipkart_dev_hub_network_cmp_key"
    display_name = "flipkart_dev_hub_vcn"
  }

  "flipkart_dev_spoke1_vcn1_key" = {
    cidr_blocks  = ["10.0.1.0/24"]
    cmp_key      = "flipkart_dev_spoke1_network_cmp_key"
    display_name = "flipkart_dev_spoke1_vcn1"
  }
}

gws = {
  igws = {

    "flipkart_dev_hub_igw_key" = {
      cmp_key      = "flipkart_dev_hub_network_cmp_key"
      display_name = "flipkart_dev_hub_igw"
      vcn_key      = "flipkart_dev_hub_vcn_key"
    }
  },

  drgs = {

    "flipkart_dev_hub_drg_key" = {
      cmp_key      = "flipkart_dev_hub_network_cmp_key"
      display_name = "flipkart_dev_hub_drg"
    }
  }  
}

drg_attachments = {
    "flipkart_dev_hub_drg_attachment_key" = {
      drg_key      = "flipkart_dev_hub_drg_key"
      display_name = "flipkart_dev_hub_drg_attachment"
      vcn_key      = "flipkart_dev_hub_vcn_key"
    }

    "flipkart_dev_spoke1_drg_attachment_key" = {
      drg_key      = "flipkart_dev_hub_drg_key"
      display_name = "flipkart_dev_spoke1_drg_attachment"
      vcn_key      = "flipkart_dev_spoke1_vcn1_key"
    }
  }

rts = {
  "flipkart_dev_hub_public_subnet_rt_key" = {
    cmp_key         = "flipkart_dev_hub_network_cmp_key"
    display_name    = "flipkart_dev_hub_public_subnet_rt"
    vcn_key         = "flipkart_dev_hub_vcn_key"
    route_rules_key = "flipkart_dev_hub_public_subnet_rt_rules_key"
  }

  "flipkart_dev_spoke1_vcn1_private_subnet_rt_key" = {
    cmp_key         = "flipkart_dev_spoke1_network_cmp_key"
    display_name    = "flipkart_dev_spoke1_vcn1_private_subnet_rt"
    vcn_key         = "flipkart_dev_spoke1_vcn1_key"
    route_rules_key = "flipkart_dev_spoke1_vcn1_app_private_subnet1_rt_rules_key"
  }
}

sls = {
  "flipkart_dev_hub_public_subnet_sl_key" = {
    cmp_key      = "flipkart_dev_hub_network_cmp_key"
    display_name = "flipkart_dev_hub_public_subnet_sl"
    vcn_key      = "flipkart_dev_hub_vcn_key"

    egress_security_rules_key  = "flipkart_dev_hub_public_subnet_sl_egress_rules_key"
    ingress_security_rules_key = "flipkart_dev_hub_public_subnet_sl_ingress_rules_key"
  }

  "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_key" = {
    cmp_key      = "flipkart_dev_spoke1_network_cmp_key"
    display_name = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl"
    vcn_key      = "flipkart_dev_spoke1_vcn1_key"

    egress_security_rules_key  = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_egress_rules_key"
    ingress_security_rules_key = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_ingress_rules_key"
  }
}

subnets = {
  "flipkart_dev_hub_public_subnet_key" = {
    cmp_key                           = "flipkart_dev_hub_network_cmp_key"
    display_name                      = "flipkart_dev_hub_public_subnet"
    cidr_block                        = "10.0.0.0/25"
    vcn_key                           = "flipkart_dev_hub_vcn_key"
    rt_key                            = "flipkart_dev_hub_public_subnet_rt_key"
    sl_keys                           = ["flipkart_dev_hub_public_subnet_sl_key"]
    subnet_prohibit_public_ip_on_vnic = false
  }

  "flipkart_dev_spoke1_vcn1_app_private_subnet1_key" = {
    cmp_key                           = "flipkart_dev_spoke1_network_cmp_key"
    display_name                      = "flipkart_dev_spoke1_vcn1_app_private_subnet1"
    cidr_block                        = "10.0.1.0/26"
    vcn_key                           = "flipkart_dev_spoke1_vcn1_key"
    rt_key                            = "flipkart_dev_spoke1_vcn1_private_subnet_rt_key"
    sl_keys                           = ["flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_key"]
    subnet_prohibit_public_ip_on_vnic = true
  }
}
