# api-gateway

<!-- Include a brief description of your pack -->

This pack is a simple Nomad job that runs as a service and can be accessed via
HTTP.

## Pack Usage

```
nomad-pack run api-gateway --var node_pool="ingress"
```

## Variables

- `job_name` (string) - The name to use as the job name which overrides using
  the pack name
- `datacenters` (list of strings) - A list of datacenters in the region which
  are eligible for task placement
- `region` (string) - The region where jobs will be deployed
- `node_pool` (string) - TODO
