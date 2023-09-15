api-gateway.configure_gateway=true
api-gateway.consul_build="linux_amd64"
api-gateway.consul_version="1.16.1"
api-gateway.custom_gateway_config=""
api-gateway.datacenters=["*"]
api-gateway.gateway_name="my-api-gateway"
api-gateway.job_name=""
api-gateway.node_pool=""
api-gateway.port=8443
api-gateway.region=""
api-gateway.raw_exec=false
api-gateway.download_consul=true

# variable "api-gateway.constraints"
#   description: Constraints to place on this job
#   type: list(object({value = string, attribute = string, operator = string}))
#   default: []
#
api-gateway.constraints=[]