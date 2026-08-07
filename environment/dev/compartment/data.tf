data "terraform_remote_state" "app_compartment" {
  backend = "local"

  config = {
    path = "/home/debayan/Desktop/OCICODE/global/compartment/terraform.tfstate"
  }
}