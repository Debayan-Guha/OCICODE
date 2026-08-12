resource "oci_core_drg_attachment" "drg_attachment" {

  drg_id       = var.drg_attachment_drg_id
  display_name = var.drg_attachment_display_name

  network_details {
    id   = var.drg_attachment_vcn_id
    type = "VCN"
  }
}