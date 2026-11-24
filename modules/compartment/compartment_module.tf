resource "oci_identity_compartment" "test_compartment" {
  compartment_id = var.compartment_parent_id
  name           = var.compartment_name
}