API Gateway has been deployed to Nomad.

[[- if var "configure_gateway" . -]]
The gateway will be auto-configured.
[[ else ]]
You must configure this gateway manually in Consul. See documentation.
[[ end ]]
