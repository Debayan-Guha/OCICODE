route_rules = {
  "flipkart_dev_hub_public_subnet_rt_rules" = [
    {
      gw               = "flipkart_dev_hub_igw"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      description      = "Route outbound Internet traffic from the Hub public subnet through the Internet Gateway."
    },
    {
      gw               = "flipkart_dev_hub_drg"
      destination      = "10.0.1.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic from the Hub VCN to the Spoke1 VCN through the Dynamic Routing Gateway."
    }
  ],
  "flipkart_dev_spoke1_vcn_web_private_subnet_rt_rules" = [
    {
      gw               = "flipkart_dev_hub_drg"
      destination      = "10.0.0.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic from the Spoke1 Web private subnet to the Hub VCN through the Dynamic Routing Gateway."
    },
    {
      gw               = "flipkart_dev_spoke1_ngw"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      description      = "Route outbound Internet traffic from the Spoke1 Web private subnet through the NAT Gateway."
    },
    {
      gw               = "flipkart_dev_spoke1_sgw"
      destination      = "all-fra-services-in-oracle-services-network"
      destination_type = "SERVICE_CIDR_BLOCK"
      description      = "Route traffic from the Spoke1 Web private subnet to supported OCI services through the Service Gateway."
    }
  ],
  "flipkart_dev_spoke1_vcn_app_private_subnet_rt_rules" = [
    {
      gw               = "flipkart_dev_hub_drg"
      destination      = "10.0.0.0/24"
      destination_type = "CIDR_BLOCK"
      description      = "Route traffic from the Spoke1 App private subnet to the Hub VCN through the Dynamic Routing Gateway."
    },
    {
      gw               = "flipkart_dev_spoke1_sgw"
      destination      = "all-fra-services-in-oracle-services-network"
      destination_type = "SERVICE_CIDR_BLOCK"
      description      = "Route traffic from the Spoke1 App private subnet to supported OCI services through the Service Gateway."
    }
  ]
}
