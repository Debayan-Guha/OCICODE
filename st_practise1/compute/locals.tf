locals {
  compartment_ids = merge(
    {
      "st_practise1_compartment" = "ocid1.compartment.oc1..aaaaaaaarlhlfy7qfa6qhlj6zk5wvrp7cqr2x2b6sythkzrogjfgjzm67feq"
    }
  )

  subnet_ids=merge(
    data.terraform_remote_state.subnet.outputs.subnet_ids
  )
}
