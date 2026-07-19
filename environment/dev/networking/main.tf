module "vcn" {
  source = "../../../modules/networking/vcn"

  for_each = var.vcns

  vcn_cidr_blocks  = each.value.cidr_blocks
  vcn_cmp_id       = local.compartment_ids[each.value.cmp_key]
  vcn_display_name = each.value.display_name
}

module "sl" {
  source = "../../../modules/networking/sl"

  for_each = var.sls

  sl_cmp_id       = local.compartment_ids[each.value.cmp_key]
  sl_vcn_id       = module.vcn[each.value.vcn_key].vcn_id
  sl_display_name = each.value.display_name

  egress_security_rules  = try(var.egress_security_rules[each.value.egress_security_rules_key], null)
  ingress_security_rules = try(var.ingress_security_rules[each.value.ingress_security_rules_key], null)
}

module "igw" {
  source = "../../../modules/networking/gw/igw"

  for_each = var.igws

  igw_cmp_id       = local.compartment_ids[each.value.cmp_key]
  igw_display_name = each.value.display_name
  igw_vcn_id       = module.vcn[each.value.vcn_key].vcn_id
}

module "rt" {
  source = "../../../modules/networking/rt"

  for_each = var.rts

  rt_cmp_id       = local.compartment_ids[each.value.cmp_key]
  rt_vcn_id       = module.vcn[each.value.vcn_key].vcn_id
  rt_display_name = each.value.display_name

  route_rules = try([
    for rule in var.route_rules[each.value.route_rules_key] : {

      cidr_block       = rule.cidr_block
      destination      = rule.destination
      destination_type = rule.destination_type

      network_entity_id = local.gateway_inventory[rule.gw_type][rule.gw_key]

      description = rule.description

    }
  ], null)
}

module "subnet" {
  source = "../../../modules/networking/subnet"

  for_each = var.subnets

  subnet_vcn_id       = module.vcn[each.value.vcn_key].vcn_id
  subnet_cmp_id       = local.compartment_ids[each.value.cmp_key]
  subnet_display_name = each.value.display_name
  subnet_cidr_block   = each.value.cidr_block

  subnet_route_table_id = try(module.rt[each.value.rt_key].rt_id, null)
  subnet_security_list_ids = try([
    for key in each.value.sl_keys : module.sl[key].sl_id
  ], null)

  subnet_prohibit_public_ip_on_vnic = each.value.subnet_prohibit_public_ip_on_vnic
}

