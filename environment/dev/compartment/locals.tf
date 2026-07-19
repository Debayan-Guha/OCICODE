locals {
  compartment_ids = {
    "app_cmp" = data.terraform_remote_state.app_compartment.outputs.app_cmp_id
  }
}