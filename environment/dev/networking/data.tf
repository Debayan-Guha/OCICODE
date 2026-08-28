data "terraform_remote_state" "dev_compartments" {
  backend = "local"

  config = {
    path = "/home/debayan/Desktop/OCICODE/environment/dev/compartment/terraform.tfstate"
  }
}

data "oci_core_services" "all_services" {}