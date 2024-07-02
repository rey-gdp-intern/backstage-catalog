variable "cloud_provider" {
  description = "The cloud provider to deploy to"
  type        = string
}

variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "resource_name" {
  description = "The name of the VM"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key"
  type        = string
}

variable "gcp_credentials_path" {
  description = "The path of GCP credentials"
  type        = string
}
