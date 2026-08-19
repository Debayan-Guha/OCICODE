module "vcn" {
  source = "../../../modules/networking/vcn"

  for_each = var.vcns

  vcn_cidr_blocks  = each.value.cidr_blocks
  vcn_cmp_id       = local.compartment_ids[each.value.cmp]
  vcn_display_name = each.key
}

module "sl" {
  source = "../../../modules/networking/sl"

  for_each = var.sls

  sl_cmp_id       = local.compartment_ids[each.value.cmp]
  sl_vcn_id       = module.vcn[each.value.vcn].vcn_id
  sl_display_name = each.key

  egress_security_rules  = try(var.egress_security_rules[each.value.egress_security_rules], null)
  ingress_security_rules = try(var.ingress_security_rules[each.value.ingress_security_rules], null)
}

module "igw" {
  source = "../../../modules/networking/gw/igw"

  for_each = var.gws != null && var.gws.igws != null ? var.gws.igws : {}

  igw_cmp_id       = local.compartment_ids[each.value.cmp]
  igw_display_name = each.key
  igw_vcn_id       = module.vcn[each.value.vcn].vcn_id
}

module "drg" {
  source = "../../../modules/networking/gw/drg"

  for_each = var.gws != null && var.gws.drgs != null ? var.gws.drgs : {}

  drg_cmp_id       = local.compartment_ids[each.value.cmp]
  drg_display_name = each.key
}

module "drg_attachment" {
  source = "../../../modules/networking/gw/drg_attachment"

  for_each = var.drg_attachments !=null ? var.drg_attachments : {}

  drg_attachment_drg_id = module.drg[each.value.drg].drg_id
  drg_attachment_display_name = each.key
  drg_attachment_vcn_id = module.vcn[each.value.vcn].vcn_id
}

module "rt" {
  source = "../../../modules/networking/rt"

  for_each = var.rts

  rt_cmp_id       = local.compartment_ids[each.value.cmp]
  rt_vcn_id       = module.vcn[each.value.vcn].vcn_id
  rt_display_name = each.key

  route_rules = try([
    for rule in var.route_rules[each.value.route_rules] : {

      destination      = rule.destination
      destination_type = rule.destination_type

      network_entity_id = local.gateway_inventory[rule.gw]

      description = rule.description

    }
  ], null)
}

module "subnet" {
  source = "../../../modules/networking/subnet"

  for_each = var.subnets

  subnet_vcn_id       = module.vcn[each.value.vcn].vcn_id
  subnet_cmp_id       = local.compartment_ids[each.value.cmp]
  subnet_display_name = each.key
  subnet_cidr_block   = each.value.cidr_block

  subnet_route_table_id = try(module.rt[each.value.rt].rt_id, null)
  subnet_security_list_ids = try([
    for key in each.value.sl : module.sl[key].sl_id
  ], null)

  subnet_prohibit_public_ip_on_vnic = each.value.subnet_prohibit_public_ip_on_vnic
}

