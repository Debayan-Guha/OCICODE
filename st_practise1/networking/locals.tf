locals {
  compartment_ids = merge(
    {
      "st_practise1_compartment" = "ocid1.compartment.oc1..aaaaaaaarlhlfy7qfa6qhlj6zk5wvrp7cqr2x2b6sythkzrogjfgjzm67feq"
    }
  )

  gateway_ids = merge({
    for key, value in module.igw :
    key => value.igw_id
  })
}
