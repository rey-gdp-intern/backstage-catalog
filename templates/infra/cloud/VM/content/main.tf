module "compute_engine" {
  source                = "../../../modules/compute-engine"
  cloud_provider        = var.cloud_provider
  project_id            = var.project_id
  region                = var.region
  resource_name         = var.resource_name
  machine_type          = var.machine_type
  ssh_public_key        = var.ssh_public_key
  gcp_credentials_path  = var.gcp_credentials_path
}
