provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    useradd -m -d /home/${var.ssh_username} -s /bin/bash ${var.ssh_username}
    echo "${var.ssh_username}:${var.ssh_password}" | chpasswd
    EOF
}
