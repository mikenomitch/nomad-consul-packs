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
