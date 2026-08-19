instances = {

  "flipkart_dev_hub_vm" = {

    instance_availability_domain     = "AD1"
    instance_cmp                     = "flipkart_dev_hub_compute_and_storage_cmp"
    instance_assign_public_ip        = true
    instance_subnet                  = "flipkart_dev_hub_public_subnet"
    instance_memory_in_gbs           = "24"
    instance_ocpus                   = "2"
    instance_boot_volume_size_in_gbs = "70"
    instance_image_id                = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaoiwaatpf6sjtuhyoupgloykq72wydgv2u36q6wqqjxke5vkwmyzq" # Oracle Linux image ID
  }

  "flipkart_dev_spoke1_vm" = {

    instance_availability_domain     = "AD1"
    instance_cmp                     = "flipkart_dev_spoke1_compute_and_storage_cmp"
    instance_assign_public_ip        = false
    instance_subnet                  = "flipkart_dev_spoke1_vcn1_app_private_subnet1"
    instance_memory_in_gbs           = "24"
    instance_ocpus                   = "2"
    instance_boot_volume_size_in_gbs = "70"
    instance_image_id                = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa4vgbg74nu5srfbe37nawmyrlc5csbgmprclortb7q563gob3nedq" # Hub VM custom image ID
  }
}
