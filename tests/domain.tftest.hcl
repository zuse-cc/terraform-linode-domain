mock_provider "linode" {}

variables {
  env     = "tst"
  service = "my-dns"
  tld     = "my-domain.example"
}

run "sets_tags_based_on_inputs" {
  assert {
    condition     = contains(linode_domain.d.tags, "env:tst")
    error_message = "Value for env should be tst"
  }

  assert {
    condition     = contains(linode_domain.d.tags, "service:my-dns")
    error_message = "Value for service should be my-dns"
  }
}

run "creates_ns_records_for_parent" {
  variables {
    parent = {
      domain_id = 123
    }
  }

  assert {
    condition     = length(linode_domain_record.ns) > 0
    error_message = "Expected at least one NS record"
  }

  assert {
    condition     = alltrue([for r in linode_domain_record.ns : r.domain_id == 123])
    error_message = "Expected at least one NS record"
  }
}
