data "terraform_remote_state" "compartment" {
  
  backend = "local"

 config = {
   path = "/home/debayan/Desktop/OCICODE/environment/dev/compartment/terraform.tfstate"
 }
}

data "terraform_remote_state" "subnet" {
  
  backend = "local"

 config = {
   path = "/home/debayan/Desktop/OCICODE/environment/dev/networking/terraform.tfstate"
 }
}