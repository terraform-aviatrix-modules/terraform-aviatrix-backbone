Any map data can also easily be inserted as a YAML file.

A simple example of a YAML file below, which contains the values we would like to use for the transit_firenet argument:

transit.yaml:
```hcl
transit1:
  transit_ha_gw: false
  transit_asn: 65101
  transit_cidr: 10.1.0.1/23
  transit_cloud: aws
  transit_region_name: us-west-1

transit2:
  transit_ha_gw: false
  transit_asn: 65103
  transit_cidr: 10.1.4.0/23
  transit_cloud: aws
  transit_region_name: eu-central-1

transit4:
  transit_ha_gw: false
  transit_asn: 65104
  transit_cidr: 10.1.6.0/23
  transit_cloud: aws
  transit_region_name: eu-west-1
```

This file can then be ingested with the yamldecode function:

```
module "framework" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "v1.2.2"

  global_settings = {
    transit_accounts = {
      azure = "Azure",
      oci   = "OCI",
      aws   = "AWS",
    }
  }

  transit_firenet = yamldecode(file("transit.yml"))
}
```