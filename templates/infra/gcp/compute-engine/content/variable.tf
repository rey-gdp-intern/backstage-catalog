variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources"
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

variable "ssh_username" {
  description = "The SSH username"
  type        = string
}

variable "ssh_password" {
  description = "The SSH password"
  type        = string
}

variable "gcp_credentials_path" {
  description = "The path of gcp credentials"
  type        = string
}
