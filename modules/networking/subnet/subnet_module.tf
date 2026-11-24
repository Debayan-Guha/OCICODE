resource "oci_core_subnet" "test_subnet" {

  compartment_id = var.subnet_compartment_id
  vcn_id         = var.subnet_vcn_id
  cidr_block     = var.subnet_cidr_block
  display_name   = var.subnet_display_name

  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
  route_table_id             = var.subnet_route_table_id
  security_list_ids          = var.subnet_security_list_ids
}
