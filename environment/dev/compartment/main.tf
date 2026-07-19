module "cmp" {
  source = "../../../modules/compartment"

  parent_cmp_id   = local.compartment_ids["app_cmp"]
  cmp_name        = var.cmp_name
  cmp_description = var.cmp_description
}

module "sub_cmps" {
  source = "../../../modules/compartment"

  for_each = var.sub_cmps

  parent_cmp_id   = module.cmp.cmp_id
  cmp_name        = each.value.cmp_name
  cmp_description = each.value.cmp_description
}
