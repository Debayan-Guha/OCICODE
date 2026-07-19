data "terraform_remote_state" "dev_compartments" {
  backend = "local"

  config = {
    path = "/home/debayan/Desktop/flipkart/environment/dev/compartment/terraform.tfstate"
  }
}