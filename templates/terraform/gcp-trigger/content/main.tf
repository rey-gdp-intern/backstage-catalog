resource "google_cloudbuild_trigger" "trigger" {
  name    = var.trigger_name
  project = var.project_id

  github {
    name    = var.repo_name
    owner   = var.repo_owner
    push {
      branch = var.branch_name
    }
  }

  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "gcr.io/${var.project_id}/${var.repo_name}:${var.commit_sha}", "."]
    }
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["push", "gcr.io/${var.project_id}/${var.repo_name}:${var.commit_sha}"]
    }
    images = ["gcr.io/${var.project_id}/${var.repo_name}:${var.commit_sha}"]
  }
}

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
  description = "Branch name to trigger builds"
}

variable "commit_sha" {
  description = "Commit SHA for the Docker image"
}
