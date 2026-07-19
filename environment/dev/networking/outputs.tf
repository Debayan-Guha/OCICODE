output "subnet_ids" {
  value = {
    for key, val in module.subnet : key => {
      id = val.subnet_id
    }
  }
}