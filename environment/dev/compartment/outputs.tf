output "dev_cmp_ids" {
  value = {
    for key, value in module.sub_cmps : key => value.cmp_id
  }
}