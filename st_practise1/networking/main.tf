module "vcn" {
  source = "../../modules/networking/vcn"

  for_each = var.vcns

  vcn_compartment_id = local.compartment_ids[each.value.vcn_compartment_key]
  vcn_cidr_block     = each.value.vcn_cidr_block
  vcn_display_name   = each.key
}


module "security_list" {
  source = "../../modules/networking/sl"

  for_each = var.security_lists

  security_list_compartment_id = local.compartment_ids[each.value.security_list_compartment_key]
  security_list_vcn_id         = module.vcn[each.value.security_list_vcn_key].vcn_id
  security_list_display_name   = each.key

  security_list_egress_security_rules  = try(each.value.security_list_egress_security_rules, null)
  security_list_ingress_security_rules = try(each.value.security_list_ingress_security_rules, null)

}


module "igw" {
  source = "../../modules/networking/gw/igw"

  for_each = var.igws

  igw_compartment_id = local.compartment_ids[each.value.igw_compartment_key]
  igw_vcn_id         = module.vcn[each.value.igw_vcn_key].vcn_id
  igw_display_name   = each.key

}


module "route_table" {
  source = "../../modules/networking/rt"

  for_each = var.route_tables

  route_table_compartment_id = local.compartment_ids[each.value.route_table_compartment_key]
  route_table_vcn_id         = module.vcn[each.value.route_table_vcn_key].vcn_id
  route_table_display_name   = each.key

  route_rules = try([for rule in each.value.route_rules :
    {
      network_entity_id = local.gateway_ids[rule.gw_key]
      destination       = rule.destination
      destination_type  = rule.destination_type
  }], null)
}

module "subnet" {
  source = "../../modules/networking/subnet"

  for_each = var.subnets

  subnet_compartment_id = local.compartment_ids[each.value.subnet_compartment_key]
  subnet_vcn_id         = module.vcn[each.value.subnet_vcn_key].vcn_id
  subnet_cidr_block     = each.value.subnet_cidr_block
  subnet_display_name   = each.key

  subnet_prohibit_public_ip_on_vnic = each.value.subnet_prohibit_public_ip_on_vnic
  subnet_route_table_id             = module.route_table[each.value.subnet_route_table_key].route_table_id

  subnet_security_list_ids = [
    for sl_key in each.value.subnet_security_list_keys :
    module.security_list[sl_key].security_list_id
  ]
}
