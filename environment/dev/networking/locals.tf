locals {
  gateway_inventory = merge(

    {
      for k, v in module.igw : k => v.igw_id
    },
    {
      for k, v in module.drg : k => v.drg_id
    },
    {
      for k, v in module.ngw : k => v.ngw_id
    },
    {
      for k, v in module.sgw : k => v.sgw_id
    }
  )

# the merge() function takes two or more maps (or objects) and combines all their key-value pairs into a single, unified map.
  compartment_ids = merge(
  # 1. Converts the single string output into a key-value map entry. As in cmp-outputs file this is not map and single id 
  { "flipkart_dev_cmp" = data.terraform_remote_state.dev_compartments.outputs.dev_cmp_id },

  # Map 2: Already has keys ("flipkart_dev_hub_cmp", "flipkart_dev_spoke1_cmp")
  data.terraform_remote_state.dev_compartments.outputs.hub_and_spoke_cmps_ids,

  # Map 3: Already has keys ("flipkart_dev_hub_network_cmp", "flipkart_dev_hub_compute_and_storage_cmp")
  data.terraform_remote_state.dev_compartments.outputs.hub_inner_cmps_ids,

  # Map 4: Already has keys ("flipkart_dev_spoke1_network_cmp", "flipkart_dev_spoke1_compute_and_storage_cmp")
  data.terraform_remote_state.dev_compartments.outputs.spoke1_inner_cmps_ids
)

 object_storage_service_id = [
    for s in data.oci_core_services.all_services.services : s.id
    if strcontains(s.name, "Object Storage")
  ][0]

}