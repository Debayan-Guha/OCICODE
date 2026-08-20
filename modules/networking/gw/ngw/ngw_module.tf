resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.ngw_cmp_id
  vcn_id         = var.ngw_vcn_id
  display_name   = var.ngw_display_name
}