module "framework" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "v8.0.0"

  global_settings = {
    transit_accounts = {
      azure = "Azure",
      oci   = "OCI",
      aws   = "AWS",
    }
  }

  transit_firenet = jsondecode(file("transit.json"))
}
