resource "oci_identity_compartment" "compartment" {

  compartment_id = var.parent_cmp_id
  name           = var.cmp_name
  description    = var.cmp_description
  enable_delete  = var.cmp_enable_delete
}
