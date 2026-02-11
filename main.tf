resource "linode_domain" "d" {
  type      = "master"
  domain    = var.tld
  soa_email = "hostmaster@${var.tld}"
  tags      = ["env:${var.env}", "service:${var.service}", "managed-by:terraform"]
}

resource "linode_domain_record" "ns" {
  for_each    = var.parent != null ? local.linode_ns_servers : []
  domain_id   = var.parent.domain_id
  name        = var.tld
  record_type = "NS"
  target      = each.value
}
