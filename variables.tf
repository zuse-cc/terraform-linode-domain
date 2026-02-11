variable "tld" {
  type = string
}

variable "env" {
  type = string
}

variable "service" {
  type    = string
  default = "dns"
}

variable "parent" {
  description = "Parent zone if this is a subdomain"
  default     = null

  type = object({
    domain_id = string
  })
}
