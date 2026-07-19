resource "oci_core_vcn" "vcn" {
  
  cidr_blocks                      = var.vcn_cidr_blocks
  compartment_id                   = var.vcn_cmp_id
  display_name                     = var.vcn_display_name
}