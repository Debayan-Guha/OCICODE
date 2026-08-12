route_rules = {

  "flipkart_dev_hub_public_subnet_rt_rules_key" = [
    {
      gw_key           = "flipkart_dev_hub_igw_key"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      description      = "Internet traffic"
    },
    {
      gw_key           = "flipkart_dev_hub_drg_key"
      destination      = "10.0.1.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic from the Hub VCN to Spoke1 VCN through the DRG."
    },
  ],

  "flipkart_dev_spoke1_vcn1_app_private_subnet1_rt_rules_key" = [
    {
      gw_key           = "flipkart_dev_hub_drg_key"
      destination      = "10.0.0.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic to Hub VCN through DRG."
    }
  ]
}
