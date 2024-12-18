module "framework" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "v1.3.1"

  global_settings = {
    transit_accounts = {
      azure = "Azure",
      oci   = "OCI",
      aws   = "AWS",
    }
  }

  transit_firenet = yamldecode(file("transit.yml"))
}
