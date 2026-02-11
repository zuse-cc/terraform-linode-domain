output "domain_id" {
  value = linode_domain.d.id
}

output "domain_name" {
  value = linode_domain.d.domain
}

output "ns_records" {
  value = local.linode_ns_servers
}
