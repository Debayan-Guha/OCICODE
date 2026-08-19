variable "cmp_description" {
  type        = string
  description = "The description of the compartment."
}

variable "cmp_name" {
  type        = string
  description = "The name of the compartment."
}

variable "hub_and_spoke_cmps" {
  type = map(object({
    cmp_description = string
  }))
}

variable "hub_inner_cmps" {
  type = map(object({
    cmp_description = string
  }))
}

variable "spoke1_inner_cmps" {
  type = map(object({
    cmp_description = string
  }))
}