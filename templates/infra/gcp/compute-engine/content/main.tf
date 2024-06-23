module "compute_engine" {
  source         = "../../../modules/compute-engine"
  gcp_credentials_path = var.gcp_credentials_path
  project_id     = var.project_id
  region         = var.region
  zone           = var.zone
  resource_name  = var.resource_name
  machine_type   = var.machine_type
  ssh_username   = var.ssh_username
  ssh_password   = var.ssh_password
}
