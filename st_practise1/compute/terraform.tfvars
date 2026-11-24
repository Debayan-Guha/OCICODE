instances = {
  flipkart_vm1 = {
    instance_availability_domain = "bVUk:US-ASHBURN-AD-1"
    instance_compartment_key     = "st_practise1_compartment" # Replace with your actual compartment key
    instance_shape               = "VM.Standard.E5.Flex"
    
    # From your networking module (ensure this key exists in your locals)
    instance_subnet_key          = "flipkart_vcn_web_subnet" 
    
    # From generated.tf
    instance_source_id           = "ocid1.image.oc1.iad.aaaaaaaagyog3ejzvbg76vpuguqazejy347defwjqa74xcvo7jpfx3d4f5vq"
    
    instance_create_vnic_details_assign_public_ip   = true
    instance_shape_config_memory_in_gbs             = 1
    instance_shape_config_ocpus                     = 1
    instance_source_details_boot_volume_size_in_gbs = 50
    instance_source_details_boot_volume_vpus_per_gb = 10
    
    # Path to your public key
    instance_ssh_public_key                         = "/home/debayan/Desktop/Tf_practise/secrets/vm_public_key.pub"
  }
}