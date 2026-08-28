resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.sgw_cmp_id
  vcn_id         = var.sgw_vcn_id
  display_name   = var.sgw_display_name
  
  services {
    service_id = var.sgw_service_id
  }
}