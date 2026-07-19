variable "cmp_description" {
  type        = string
  description = "The description of the compartment."
}

variable "cmp_name" {
  type        = string
  description = "The name of the compartment."
}

variable "sub_cmps" {
  type = map(object({
    cmp_name        = string
    cmp_description = string
  }))
}