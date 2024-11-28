# terraform-aviatrix-backbone - release notes

## v1.2.4
- Add support for `enable_active_standby`.

## v1.2.2
- Add support for setting `enable_max_performance` on custom peerings map.

## v1.2.1
- Add support for BGP Hold time for transit gateway.
- Introduction of global_settings variable
- With the introduction of global settings, the variables `default_firenet_firewall_image` and `default_transit_accounts` are being deprecated. Use the `transit_accounts` and `firenet_firewall_image` fields in the global settings map in stead. Example:

In stead of:
```hcl
  default_firenet_firewall_image = {
    aws   = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1",
    azure = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1",
    gcp   = "Palo Alto Networks VM-Series Next-Generation Firewall BUNDLE1",
  }

  default_transit_accounts = {
    azure = "Azure",
    oci   = "OCI",
    aws   = "AWS",
  }
```

Please do:
```hcl
  global_settings = {

    firenet_firewall_image = {
        aws   = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1",
        azure = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1",
        gcp   = "Palo Alto Networks VM-Series Next-Generation Firewall BUNDLE1",
    }

    transit_accounts = {
      azure = "Azure",
      oci   = "OCI",
      aws   = "AWS",
    }
    
  }
```

## v1.2.0
- Bump module versions to support Controller version 7.1 and provider version 3.1.x.

## v1.1.2
- Add support for enable_monitor_gateway_subnets
- Fix input variable type for transit_bgp_lan_interfaces and transit_ha_bgp_lan_interfaces.

## v1.1.1
- Add support for enable_vpc_dns_server
- Fix issue where default password in mc-firenet is overwritten by the null default in this module.

## v1.1.0
Bump to 7.0 compatible modules

## v1.0.3
- Bump mc-transit module version to 2.3.3. This is required to support for VPC DNS server. Because of this, v1.0.2 of this module throws an issue.
- Add support for enable_monitor_gateway_subnets

## v1.0.2
- Fix issue where default password in mc-firenet is overwritten by the null default in this module.
- Add support for enable vpc DNS server

## v1.0.1
Fix issue in logic caused by moving to 1.3.0 optional feature

## v1.0.0
Graduate Terraform experimental optional feature to GA 1.3.0 version.

## v0.0.7
Bump to latest 6.9 compatible modules

## v0.0.6
- Add support for mc-transit module 2.2.1
- Add support for mc-peering module 1.0.8

## v0.0.5
Bump to bump to 6.8 compatible modules.

## v0.0.4
Bump to bump to latest 6.7 compatible modules.

## v0.0.3
Bump to bump to latest 6.7 compatible modules. Resolves an issue with 6.7 when deploying firenet in GCP.

## v0.0.2
Bump to 6.7 compatible modules.

## v0.0.1
Initial public release. This release is marked v0.0.1, as it uses an experimental Terraform feature.