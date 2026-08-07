cmp_name        = "flipkart_dev_cmp"
cmp_description = "Flipkart Dev Root Compartment"

hub_and_spoke_cmps = {
  "flipkart_dev_hub_cmp_key" = {
    cmp_name        = "flipkart_dev_hub_cmp"
    cmp_description = "Flipkart Dev Hub Compartment"
  },
  "flipkart_dev_spoke1_cmp_key" = {
    cmp_name        = "flipkart_dev_spoke1_cmp"
    cmp_description = "Flipkart Dev Spoke 1 Compartment"
  }
}

hub_inner_cmps = {
  "flipkart_dev_hub_network_cmp_key" = {
    cmp_name        = "flipkart_dev_hub_network_cmp"
    cmp_description = "Hub Network Compartment"
  },
  "flipkart_dev_hub_compute_and_storage_cmp_key" = {
    cmp_name        = "flipkart_dev_hub_compute_and_storage_cmp"
    cmp_description = "Hub Compute Compartment"
  }
}

spoke1_inner_cmps = {
  "flipkart_dev_spoke1_network_cmp_key" = {
    cmp_name        = "flipkart_dev_spoke1_network_cmp"
    cmp_description = "Spoke 1 Network Compartment"
  },
  "flipkart_dev_spoke1_compute_and_storage_cmp_key" = {
    cmp_name        = "flipkart_dev_spoke1_compute_and_storage_cmp"
    cmp_description = "Spoke 1 Compute Compartment"
  }
}