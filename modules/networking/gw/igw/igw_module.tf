resource "oci_core_internet_gateway" "test_internet_gateway" {

  compartment_id = var.igw_compartment_id
  vcn_id         = var.igw_vcn_id
  display_name   = var.igw_display_name
  enabled        = true
}
