module "framework" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "v1.1.3"

  default_transit_accounts = {
    azure = "Azure",
    oci   = "OCI",
    aws   = "AWS",
  }

  transit_firenet = yamldecode(file("transit.yml"))
}
