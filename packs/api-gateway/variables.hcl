# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "job_name" {
  description = "The name to use as the job name which overrides using the pack name"
  type        = string
  // If "", the pack name will be used
  default = ""
}

variable "region" {
  description = "The region where jobs will be deployed"
  type        = string
  default     = ""
}

variable "datacenters" {
  description = "A list of datacenters in the region which are eligible for task placement"
  type        = list(string)
  default     = ["*"]
}

variable "node_pool" {
  description = "Node pool to place the job in"
  type        = string
  default     = ""
}

variable "port" {
  description = "The port to expose the gateway on"
  type        = number
  default     = 8443
}

variable "gateway_name" {
  description = "The name of the gateway to use"
  type        = string
  default     = "my-api-gateway"
}

variable "configure_gateway" {
  description = "Whether or not to configure the the gateway automatically"
  type        = bool
  default     = true
}

variable "constraints" {
  description = "Constraints to place on this job"
  type        = list(object({
      attribute = string
      operator = string
      value = string
  }))
  default     = []
}

variable "custom_gateway_config" {
  description = "A full gateway configuration template to use instead of the default"
  type        = string
  default     = ""
}

variable "raw_exec" {
  description = "Execute as raw_exec not exec. Helpful if you want to skip consul artifact downloading."
  type        = bool
  default     = false
}