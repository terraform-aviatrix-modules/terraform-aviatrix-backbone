#This module builds out all transits
module "transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.5.1"

  for_each = var.transit_firenet

  cloud           = each.value.transit_cloud
  cidr            = each.value.transit_cidr
  region          = each.value.transit_region_name
  local_as_number = each.value.transit_asn

  account = coalesce(
    each.value.transit_account,
    lookup(var.default_transit_accounts, each.value.transit_cloud, null), #To be removed when removing support for default_transit_accounts variable
    lookup(var.global_settings.transit_accounts, each.value.transit_cloud, null)
  )

  az_support                       = each.value.transit_az_support
  az1                              = each.value.transit_az1
  az2                              = each.value.transit_az2
  bgp_ecmp                         = try(coalesce(each.value.transit_bgp_ecmp, var.global_settings.transit_bgp_ecmp), null)
  bgp_lan_interfaces               = each.value.transit_bgp_lan_interfaces
  bgp_manual_spoke_advertise_cidrs = each.value.transit_bgp_manual_spoke_advertise_cidrs
  bgp_polling_time                 = try(coalesce(each.value.transit_bgp_polling_time, var.global_settings.transit_bgp_polling_time), null)
  connected_transit                = try(coalesce(each.value.transit_connected_transit, var.global_settings.transit_connected_transit), null)
  customer_managed_keys            = try(coalesce(each.value.transit_customer_managed_keys, var.global_settings.transit_customer_managed_keys), null)
  enable_active_standby            = each.value.transit_enable_active_standby
  enable_active_standby_preemptive = try(coalesce(each.value.transit_enable_active_standby_preemptive, var.global_settings.transit_enable_active_standby_preemptive), null)
  enable_advertise_transit_cidr    = try(coalesce(each.value.transit_enable_advertise_transit_cidr, var.global_settings.transit_enable_advertise_transit_cidr), null)
  enable_bgp_over_lan              = each.value.transit_enable_bgp_over_lan
  enable_egress_transit_firenet    = try(coalesce(each.value.transit_enable_egress_transit_firenet, var.global_settings.transit_enable_egress_transit_firenet), null)
  enable_encrypt_volume            = coalesce(each.value.transit_enable_encrypt_volume, var.global_settings.transit_enable_encrypt_volume, lower(each.value.transit_cloud) == "aws" ? true : false)
  enable_firenet                   = each.value.transit_enable_firenet
  enable_multi_tier_transit        = try(coalesce(each.value.transit_enable_multi_tier_transit, var.global_settings.transit_enable_multi_tier_transit), null)
  enable_s2c_rx_balancing          = try(coalesce(each.value.transit_enable_s2c_rx_balancing, var.global_settings.transit_enable_s2c_rx_balancing), null)

  enable_segmentation = (
    coalesce(
      each.value.transit_enable_egress_transit_firenet,
      var.global_settings.transit_enable_egress_transit_firenet
    ) ?
    false
    :
    coalesce(each.value.transit_segmentation, var.global_settings.transit_segmentation)
  )

  enable_transit_firenet = coalesce(
    each.value.transit_enable_transit_firenet,
    each.value.firenet,
    var.global_settings.transit_enable_transit_firenet,
    var.global_settings.firenet,
  )

  gw_name                          = each.value.transit_gw_name
  ha_bgp_lan_interfaces            = each.value.transit_ha_bgp_lan_interfaces
  ha_cidr                          = each.value.transit_ha_cidr
  ha_gw                            = try(coalesce(each.value.transit_ha_gw, var.global_settings.transit_ha_gw), null)
  ha_region                        = each.value.transit_ha_region
  hybrid_connection                = each.value.transit_hybrid_connection
  insane_mode                      = try(coalesce(each.value.transit_insane_mode, var.global_settings.transit_insane_mode), null)
  instance_size                    = each.value.transit_instance_size
  lan_cidr                         = each.value.transit_lan_cidr
  learned_cidr_approval            = try(coalesce(each.value.transit_learned_cidr_approval, var.global_settings.transit_learned_cidr_approval), null)
  learned_cidrs_approval_mode      = try(coalesce(each.value.transit_learned_cidrs_approval_mode, var.global_settings.transit_learned_cidrs_approval_mode), null)
  legacy_transit_vpc               = each.value.transit_legacy_transit_vpc
  name                             = each.value.transit_name
  resource_group                   = each.value.transit_resource_group
  single_az_ha                     = try(coalesce(each.value.transit_single_az_ha, var.global_settings.transit_single_az_ha), null)
  single_ip_snat                   = each.value.transit_single_ip_snat
  tags                             = try(coalesce(each.value.transit_tags, var.global_settings.transit_tags), null)
  tunnel_detection_time            = try(coalesce(each.value.transit_tunnel_detection_time, var.global_settings.transit_tunnel_detection_time), null)
  availability_domain              = each.value.transit_availability_domain
  ha_availability_domain           = each.value.transit_ha_availability_domain
  fault_domain                     = each.value.transit_fault_domain
  ha_fault_domain                  = each.value.transit_ha_fault_domain
  enable_preserve_as_path          = try(coalesce(each.value.transit_enable_preserve_as_path, var.global_settings.transit_enable_preserve_as_path), null)
  enable_gateway_load_balancer     = each.value.transit_enable_gateway_load_balancer
  bgp_lan_interfaces_count         = each.value.transit_bgp_lan_interfaces_count
  private_mode_lb_vpc_id           = each.value.transit_private_mode_lb_vpc_id
  private_mode_subnets             = each.value.transit_private_mode_subnets
  allocate_new_eip                 = each.value.transit_allocate_new_eip
  eip                              = each.value.transit_eip
  ha_eip                           = each.value.transit_ha_eip
  azure_eip_name_resource_group    = each.value.transit_azure_eip_name_resource_group
  ha_azure_eip_name_resource_group = each.value.transit_ha_azure_eip_name_resource_group
  enable_vpc_dns_server            = each.value.transit_enable_vpc_dns_server
  enable_monitor_gateway_subnets   = try(coalesce(each.value.transit_enable_monitor_gateway_subnets, var.global_settings.transit_enable_monitor_gateway_subnets), null)
  enable_gro_gso                   = try(coalesce(each.value.transit_enable_gro_gso, var.global_settings.transit_enable_gro_gso), null)
  bgp_hold_time                    = try(coalesce(each.value.transit_bgp_hold_time, var.global_settings.transit_bgp_hold_time), null)
}

#This module builds out firenet, only on transits for which Firenet is enabled.
module "firenet" {
  source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
  version = "1.5.0"

  #Filter transits that have firenet enabled
  for_each = { for k, v in var.transit_firenet : k => v if
    try(coalesce(v.firenet), false) || (var.global_settings.firenet && v.firenet == null)
  }

  transit_module = module.transit[each.key]

  attached                            = try(coalesce(each.value.firenet_attached, var.global_settings.firenet.attached), null)
  bootstrap_bucket_name_1             = each.value.firenet_bootstrap_bucket_name_1
  bootstrap_bucket_name_2             = each.value.firenet_bootstrap_bucket_name_2
  bootstrap_storage_name_1            = each.value.firenet_bootstrap_storage_name_1
  bootstrap_storage_name_2            = each.value.firenet_bootstrap_storage_name_2
  custom_fw_names                     = each.value.firenet_custom_fw_names
  east_west_inspection_excluded_cidrs = try(coalesce(each.value.firenet_east_west_inspection_excluded_cidrs, var.global_settings.firenet_east_west_inspection_excluded_cidrs), null)
  egress_cidr                         = each.value.firenet_egress_cidr
  egress_enabled                      = try(coalesce(each.value.firenet_egress_enabled, var.global_settings.firenet_egress_enabled), null)
  egress_static_cidrs                 = try(coalesce(each.value.firenet_egress_static_cidrs, var.global_settings.firenet_egress_static_cidrs), null)
  file_share_folder_1                 = each.value.firenet_file_share_folder_1
  file_share_folder_2                 = each.value.firenet_file_share_folder_2

  firewall_image = coalesce(
    each.value.firenet_firewall_image,
    lookup(var.default_firenet_firewall_image, each.value.transit_cloud, null), #To be removed when removing support for default_transit_accounts variable
    lookup(var.global_settings.firenet_firewall_image, each.value.transit_cloud, null),
  )

  firewall_image_id                    = each.value.firenet_firewall_image_id
  firewall_image_version               = each.value.firenet_firewall_image_version
  fw_amount                            = try(coalesce(each.value.firenet_fw_amount, var.global_settings.firenet_fw_amount), null)
  iam_role_1                           = each.value.firenet_iam_role_1
  iam_role_2                           = each.value.firenet_iam_role_2
  inspection_enabled                   = try(coalesce(each.value.firenet_inspection_enabled, var.global_settings.firenet_inspection_enabled), null)
  instance_size                        = each.value.firenet_instance_size
  keep_alive_via_lan_interface_enabled = try(coalesce(each.value.firenet_keep_alive_via_lan_interface_enabled, var.global_settings.firenet_keep_alive_via_lan_interface_enabled), null)
  mgmt_cidr                            = each.value.firenet_mgmt_cidr
  password                             = each.value.firenet_password
  storage_access_key_1                 = each.value.firenet_storage_access_key_1
  storage_access_key_2                 = each.value.firenet_storage_access_key_2
  tags                                 = try(coalesce(each.value.firenet_tags, var.global_settings.firenet_tags), null)
  user_data_1                          = each.value.firenet_user_data_1
  user_data_2                          = each.value.firenet_user_data_2
  username                             = each.value.firenet_username
}

### Peering for full_mesh peering mode ###
#Create full mesh peering 
module "full_mesh_peering" {
  source  = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
  version = "1.0.8"

  count = local.peering_mode == "full_mesh" ? 1 : 0

  transit_gateways = [for k, v in module.transit : v.transit_gateway.gw_name if v.transit_gateway.enable_egress_transit_firenet == false] #Filter out egress transits
  excluded_cidrs   = var.excluded_cidrs
  prune_list       = local.peering_prune_list
}
##########################################

### Peering for full_mesh_optimized peering mode ###
#Create full mesh peering intra-cloud  
module "full_mesh_optimized_peering_intra_cloud" {
  source  = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
  version = "1.0.8"

  for_each = local.peering_mode == "full_mesh_optimized" ? toset(local.cloudlist) : []

  transit_gateways = [for k, v in module.transit : v.transit_gateway.gw_name if var.transit_firenet[k].transit_cloud == each.value && v.transit_gateway.enable_egress_transit_firenet == false] #Filter out egress transits
  excluded_cidrs   = var.excluded_cidrs
  prune_list       = local.peering_prune_list
}

#Create full mesh peering inter-cloud between 2 sets of gateways and prepend path to prefer intra-cloud over inter-cloud, for traffic originated outside of the Aviatrix transit (e.g. DC VPN connected to multiple transits).
module "full_mesh_optimized_peering_inter_cloud" {
  source  = "terraform-aviatrix-modules/mc-transit-peering-advanced/aviatrix"
  version = "1.0.0"

  for_each = local.peering_mode == "full_mesh_optimized" ? toset(local.cloudlist) : []

  set1 = { for k, v in module.transit : v.transit_gateway.gw_name => v.transit_gateway.local_as_number if var.transit_firenet[k].transit_cloud == each.value && v.transit_gateway.enable_egress_transit_firenet == false }                                                                 #Create list of all transit within specified cloud and filter out egress transits
  set2 = { for k, v in module.transit : v.transit_gateway.gw_name => v.transit_gateway.local_as_number if !contains(slice(local.cloudlist, 0, index(local.cloudlist, each.value) + 1), var.transit_firenet[k].transit_cloud) && v.transit_gateway.enable_egress_transit_firenet == false } #Create list of all transit NOT in specified cloud and filter out egress transits

  as_path_prepend = true
  excluded_cidrs  = var.excluded_cidrs
  prune_list      = local.peering_prune_list
}
##########################################

### Peering for custom peering mode ###
resource "aviatrix_transit_gateway_peering" "custom_peering" {
  for_each = local.peering_mode == "custom" ? var.peering_map : {}

  transit_gateway_name1                       = each.value.gw1_name
  transit_gateway_name2                       = each.value.gw2_name
  gateway1_excluded_network_cidrs             = each.value.gw1_excluded_cidrs
  gateway2_excluded_network_cidrs             = each.value.gw2_excluded_cidrs
  gateway1_excluded_tgw_connections           = each.value.gw1_excluded_tgw_connections
  gateway2_excluded_tgw_connections           = each.value.gw2_excluded_tgw_connections
  prepend_as_path1                            = each.value.prepend_as_path1
  prepend_as_path2                            = each.value.prepend_as_path2
  enable_single_tunnel_mode                   = each.value.enable_single_tunnel_mode
  tunnel_count                                = each.value.tunnel_count
  enable_peering_over_private_network         = each.value.enable_peering_over_private_network
  enable_insane_mode_encryption_over_internet = each.value.enable_insane_mode_encryption_over_internet
  enable_max_performance                      = each.value.enable_max_performance
}
##########################################
