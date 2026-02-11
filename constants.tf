locals {
  linode_ns_servers = toset([
    "ns1.linode.com",
    "ns2.linode.com",
    "ns3.linode.com",
    "ns4.linode.com",
    "ns5.linode.com"
  ])
}
