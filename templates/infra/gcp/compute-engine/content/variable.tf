variable "gcp_credentials" {
  description = "Path to the GCP credentials file"
  type        = string
}

variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources in"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Type of the machine"
  type        = string
  default     = "e2-medium"
}

variable "ssh_username" {
  description = "Username for SSH access"
  type        = string
}

variable "ssh_password" {
  description = "Password for SSH access"
  type        = string
}
