job [[ template "job_name" . ]] {
  type = "service"

  [[ template "region" . ]]
  [[ template "node_pool" . ]]
  [[ template "constraints" (var "constraints" .) ]]

  datacenters = [[ var "datacenters" . | toStringList ]]

  group "gateway" {
    network {
      port "gateway-port" {
        static = [[ var "port" . ]]
      }
    }

    [[- if var "configure_gateway" . -]]
    task "configure" {
      [[ if (var "raw_exec" .) ]]
      driver = "raw_exec"
      [[- else ]]
      driver = "exec"
      [[- end ]]

      lifecycle {
        hook = "prestart"
      }

      config {
        command = "consul"
        args = [ "config", "write", "gateways.hcl"]
      }

      template {
        data = <<EOF
[[ if var "custom_gateway_config" . ]]
[[ var "custom_gateway_config" . ]]
[[ else ]]
[[ template "gateway-template" . ]]
[[ end ]]

EOF

        destination = "locals/gateway.hcl"
      }
    }
    [[ end ]]

    task "agent" {
      [[ if (var "raw_exec" .) ]]
      driver = "raw_exec"
      [[- else ]]
      driver = "exec"
      [[- end ]]

      config {
        command = "consul"
        args = [
          "connect",
          "envoy",
          "-gateway", "api",
          "-register",
          "-service", "my-api-gateway",
        ]
      }

      [[ if var "download_consul" .shared ]]
      artifact {
        source      = "https://releases.hashicorp.com/consul/[[var "consul_version" .shared]]/consul_[[var "consul_version" .shared]]_[[var "consul_build" .shared]].zip"
        destination = "local/consul"
        mode        = "file"
      }
      [[ end ]]
    }
  }
}
