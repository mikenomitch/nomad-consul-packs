# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

app {
  url = "https://github.com/hashicorp/consul-api-gateway"
}

pack {
  name        = "api-gateway"
  description = "This pack deploys Consul API Gateway to Nomad"
  version     = "0.0.1"
}


// Optional dependency information. This block can be repeated.

// dependency {
//   name   = "demo_dependency_pack_name"
//   source = "git://source.git/packs/demo_dependency_pack"
// }
