resource "oci_core_drg" "drg" {
    
  compartment_id = var.drg_cmp_id
  display_name  = var.drg_display_name
}