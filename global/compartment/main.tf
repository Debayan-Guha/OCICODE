module "compartment" {
  source = "../../modules/compartment"

  parent_cmp_id   = var.parent_cmp_id
  cmp_name        = var.cmp_name
  cmp_description = var.cmp_description
}