# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "consul_version" {
  description = "The version of consul to use"
  type        = string
  default     = "1.16.1"
}

variable "consul_build" {
  description = "The build type of consul to use (see https://releases.hashicorp.com/consul/1.16.1 for options)"
  type        = string
  default     = "linux_amd64"
}

variable "download_consul" {
  description = "Whether or not to download consul artifact to use in commands"
  type        = bool
  default     = true
}