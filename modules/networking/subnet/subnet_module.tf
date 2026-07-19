resource "oci_core_subnet" "subnet" {

  cidr_block     = var.subnet_cidr_block
  compartment_id = var.subnet_cmp_id
  vcn_id         = var.subnet_vcn_id

  display_name      = var.subnet_display_name
  route_table_id    = var.subnet_route_table_id
  security_list_ids = var.subnet_security_list_ids

  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic

}
