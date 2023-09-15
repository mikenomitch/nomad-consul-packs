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

dependency "shared" {
  alias = "shared"
  source = "????"
}
