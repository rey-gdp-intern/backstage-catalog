variable "project_id" {
  description = "GCP Project ID"
}

variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
}

variable "repo_name" {
  description = "Name of the repository"
}

variable "repo_owner" {
  description = "Owner of the repository"
}

variable "branch_name" {
  description = "Branch name to trigger the build"
}

resource "google_cloudbuild_trigger" "trigger" {
  project  = var.project_id
  name     = var.trigger_name
  github {
    owner = var.repo_owner
    name  = var.repo_name
    push {
      branch = var.branch_name
    }
  }
  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build",
        "-t", "gcr.io/${var.project_id}/${var.repo_name}:latest",
        "."
      ]
    }
    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "push", "gcr.io/${var.project_id}/${var.repo_name}:latest"
      ]
    }
    images = ["gcr.io/${var.project_id}/${var.repo_name}:latest"]
  }
}
