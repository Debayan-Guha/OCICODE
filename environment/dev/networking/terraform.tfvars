vcns = {
  "flipkart_dev_hub_vcn" = {
    cidr_blocks = ["10.0.0.0/24"]
    cmp         = "flipkart_dev_hub_network_cmp"
  }
  "flipkart_dev_spoke1_vcn1" = {
    cidr_blocks = ["10.0.1.0/24"]
    cmp         = "flipkart_dev_spoke1_network_cmp"
  }
}

gws = {
  igws = {
    "flipkart_dev_hub_igw" = {
      cmp = "flipkart_dev_hub_network_cmp"
      vcn = "flipkart_dev_hub_vcn"
    }
  }
  drgs = {
    "flipkart_dev_hub_drg" = {
      cmp = "flipkart_dev_hub_network_cmp"
    }
  }
  ngws = {
    "flipkart_dev_spoke1_ngw" = {
      cmp = "flipkart_dev_spoke1_network_cmp"
      vcn = "flipkart_dev_spoke1_vcn1"
    }
  }
}

drg_attachments = {
  "flipkart_dev_hub_drg_attachment" = {
    drg = "flipkart_dev_hub_drg"
    vcn = "flipkart_dev_hub_vcn"
  },
  "flipkart_dev_spoke1_drg_attachment" = {
    drg = "flipkart_dev_hub_drg"
    vcn = "flipkart_dev_spoke1_vcn1"
  }

}


rts = {

  "flipkart_dev_hub_public_subnet_rt" = {
    cmp         = "flipkart_dev_hub_network_cmp"
    vcn         = "flipkart_dev_hub_vcn"
    route_rules = "flipkart_dev_hub_public_subnet_rt_rules"
  },
  "flipkart_dev_spoke1_vcn1_private_subnet_rt" = {
    cmp         = "flipkart_dev_spoke1_network_cmp"
    vcn         = "flipkart_dev_spoke1_vcn1"
    route_rules = "flipkart_dev_spoke1_vcn1_app_private_subnet1_rt_rules"
  }
}

sls = {

  "flipkart_dev_hub_public_subnet_sl" = {
    cmp                    = "flipkart_dev_hub_network_cmp"
    vcn                    = "flipkart_dev_hub_vcn"
    egress_security_rules  = "flipkart_dev_hub_public_subnet_sl_egress_rules"
    ingress_security_rules = "flipkart_dev_hub_public_subnet_sl_ingress_rules"
  },
  "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl" = {
    cmp                    = "flipkart_dev_spoke1_network_cmp"
    vcn                    = "flipkart_dev_spoke1_vcn1"
    egress_security_rules  = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_egress_rules"
    ingress_security_rules = "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl_ingress_rules"
  }
}

subnets = {
  "flipkart_dev_hub_public_subnet" = {
    cmp        = "flipkart_dev_hub_network_cmp"
    cidr_block = "10.0.0.0/25"
    vcn        = "flipkart_dev_hub_vcn"
    rt         = "flipkart_dev_hub_public_subnet_rt"
    sl = [
      "flipkart_dev_hub_public_subnet_sl"
    ]
    subnet_prohibit_public_ip_on_vnic = false
  }

  "flipkart_dev_spoke1_vcn1_app_private_subnet1" = {
    cmp = "flipkart_dev_spoke1_network_cmp"
    cidr_block = "10.0.1.0/26"
    vcn        = "flipkart_dev_spoke1_vcn1"
    rt         = "flipkart_dev_spoke1_vcn1_private_subnet_rt"
    sl = [
      "flipkart_dev_spoke1_vcn1_app_private_subnet1_sl"
    ]
    subnet_prohibit_public_ip_on_vnic = true
  }
}
