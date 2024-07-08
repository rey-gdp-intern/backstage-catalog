module "vm_${{ values.resource_name }}" {
  source  = "./../modules"
  project_id = "${{ values.projectId }}"
  region      = "${{ values.region }}"
  resource_name = "${{ values.resource_name }}"
  machine_type = "${{ values.machine_type }}"
  ssh_username= "${{ values.ssh_username }}"
  ssh_public_key = "${{ values.ssh_public_key }}"
}