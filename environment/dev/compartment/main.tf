# 1. Dev Compartment
module "dev_cmp" {
  source = "../../../modules/compartment"

  parent_cmp_id   = local.compartment_ids["app_cmp"]
  cmp_name        = var.cmp_name
  cmp_description = var.cmp_description
}

# Level 1: Hub & Spoke Compartments
module "hub_and_spoke_cmps" {
  source = "../../../modules/compartment"

  for_each = var.hub_and_spoke_cmps

  parent_cmp_id   = module.dev_cmp.cmp_id
  cmp_name        = each.key
  cmp_description = each.value.cmp_description
}

# Level 2: Inner Compartments inside HUB
module "hub_inner_cmps" {
  source = "../../../modules/compartment"

  for_each = var.hub_inner_cmps

  parent_cmp_id   = module.hub_and_spoke_cmps["flipkart_dev_hub_cmp"].cmp_id
  cmp_name        = each.key
  cmp_description = each.value.cmp_description
}

# Level 2: Inner Compartments inside SPOKE
module "spoke1_inner_cmps" {
  source = "../../../modules/compartment"

  for_each = var.spoke1_inner_cmps

  parent_cmp_id   = module.hub_and_spoke_cmps["flipkart_dev_spoke1_cmp"].cmp_id
  cmp_name        = each.key
  cmp_description = each.value.cmp_description
}