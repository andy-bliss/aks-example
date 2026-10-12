# Environment-specific values - no default, must be supplied (see terraform.tfvars.example)
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region, e.g. uksouth"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_node_resource_group_name" {
  description = "Name of the AKS-managed resource group that holds the node VMs, load balancer etc."
  type        = string
}

variable "acr_name_prefix" {
  description = "Prefix for the Azure container registry name (alphanumeric only). A 6-character hash of the subscription ID is appended to make it globally unique."
  type        = string
}

# Sensible defaults - override only if you need to
variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.240.0.0/16"]
}

variable "aks_subnet_address_prefixes" {
  description = "Address prefixes for the AKS subnet (with Azure CNI every pod gets an IP from here)"
  type        = list(string)
  default     = ["10.240.0.0/22"]
}

variable "aks_kubernetes_version" {
  description = "Kubernetes version for the AKS cluster. Null means the current AKS default; list options with: az aks get-versions --location <region> -o table"
  type        = string
  default     = null
}

variable "aks_default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "linuxsysnp"
}

variable "aks_default_node_pool_vm_size" {
  description = "VM size for the default node pool"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "aks_default_node_pool_os_sku" {
  description = "OS SKU for the default node pool"
  type        = string
  default     = "Ubuntu"
}

variable "aks_default_node_pool_os_disk_size_gb" {
  description = "OS disk size in GB for the default node pool"
  type        = number
  default     = 30
}

variable "aks_default_node_pool_minimum_node_count" {
  description = "Minimum node count for autoscaling"
  type        = number
  default     = 1
}

variable "aks_default_node_pool_maximum_node_count" {
  description = "Maximum node count for autoscaling"
  type        = number
  default     = 2
}

variable "aks_default_node_pool_availability_zones" {
  description = "Availability zones for the node pool"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "acr_sku" {
  description = "SKU of the Azure container registry"
  type        = string
  default     = "Basic"
}
