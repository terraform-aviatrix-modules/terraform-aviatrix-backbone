module "framework" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "v1.2.4"

  global_settings = {
    transit_accounts = {
      azure = "Azure",
      oci   = "OCI",
      aws   = "AWS",
    }
  }

  transit_firenet = jsondecode(file("transit.json"))
}
