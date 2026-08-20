route_rules = {

  "flipkart_dev_hub_public_subnet_rt_rules" = [
    {
      gw = "flipkart_dev_hub_igw"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      description = "Internet traffic"
    },
    {
      gw = "flipkart_dev_hub_drg"
      destination      = "10.0.1.0/24"
      destination_type = "CIDR_BLOCK"
      description = "Route traffic from the Hub VCN to Spoke1 VCN through the DRG."
    }
  ],
  "flipkart_dev_spoke1_vcn1_app_private_subnet1_rt_rules" = [
    {
      gw               = "flipkart_dev_hub_drg"
      destination      = "10.0.0.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic to Hub VCN through DRG."
    },
    {
      gw               = "flipkart_dev_spoke1_ngw"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      description      = "Default route for internet traffic via NAT Gateway."
    }
  ]
}
