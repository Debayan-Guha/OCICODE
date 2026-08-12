locals {

  availability_domain_ids = {
    AD1_key = "Xmsk:EU-FRANKFURT-1-AD-1"
    AD2_key = ""
    AD3_key = ""
  }

  compartment_ids = merge(
    data.terraform_remote_state.compartment.outputs.hub_inner_cmps_ids,
    data.terraform_remote_state.compartment.outputs.spoke1_inner_cmps_ids

  )

  subnet_ids = merge(
    data.terraform_remote_state.subnet.outputs.subnet_ids
  )
}
