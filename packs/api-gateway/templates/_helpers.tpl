[[- define "job_name" -]]
[[ coalesce ( var "job_name" .) (meta "pack.name" .) | quote ]]
[[- end -]]

[[ define "region" -]]
[[- if var "region" . -]]
  region = "[[ var "region" . ]]"
[[- end -]]
[[- end -]]

[[ define "node_pool" -]]
[[- if var "node_pool" . -]]
  node_pool = "[[ var "node_pool" . ]]"
[[- end -]]
[[- end -]]

[[ define "constraints" -]]
[[ range $idx, $constraint := . ]]
  constraint {
    attribute = [[ $constraint.attribute | quote ]]
    [[ if $constraint.operator -]]
    operator  = [[ $constraint.operator | quote ]]
    [[ end -]]
    value     = [[ $constraint.value | quote ]]
  }
[[ end -]]
[[- end -]]

[[ define "gateway-template" -]]
Kind = "api-gateway"
Name = "[[ var "gateway_name" . ]]"

// Each listener configures a port which can be used to access the Consul cluster
Listeners = [
  {
    Port     = [[ var "port" . ]]
    Name     = "my-http-listener"
    Protocol = "http"
    TLS = {
      Certificates = [
        {
          Kind = "inline-certificate"
          Name = "my-certificate"
        }
      ]
    }
  }
]
[[- end -]]
