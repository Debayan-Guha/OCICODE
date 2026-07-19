locals {
  gateway_inventory = {

    # Loops through ALL igws and builds a complete dictionary of keys and IDs
    "igw" = { for k, v in module.igw : k => v.igw_id }
  }

  compartment_ids = data.terraform_remote_state.dev_compartments.outputs.dev_cmp_ids

}