data "terraform_remote_state" "subnet" {
  backend = "local"
  config = {
    path = "/home/debayan/Desktop/Tf_practise/st_practise1/networking/terraform.tfstate"
  }
}