# Level 0: Dev Root Compartment ID
output "dev_cmp_id" {
  description = "Root Dev Compartment ID"
  value       = module.dev_cmp.cmp_id
}

# Level 1: Hub and Spoke Compartment IDs
output "hub_and_spoke_cmps_ids" {
  description = "Map of Level 1 Hub and Spoke Compartment IDs"
  value = {
    for key, value in module.hub_and_spoke_cmps : key => value.cmp_id
  }
}

# Level 2: Hub Inner Compartment IDs
output "hub_inner_cmps_ids" {
  description = "Map of Hub Inner Sub-Compartment IDs"
  value = {
    for key, value in module.hub_inner_cmps : key => value.cmp_id
  }
}

# Level 2: Spoke 1 Inner Compartment IDs
output "spoke1_inner_cmps_ids" {
  description = "Map of Spoke 1 Inner Sub-Compartment IDs"
  value = {
    for key, value in module.spoke1_inner_cmps : key => value.cmp_id
  }
}