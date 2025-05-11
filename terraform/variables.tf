variable "resource_group_name" {
  description = "resource group name"
}

variable "location" {
  type        = string
  description = "uksouth for example"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to Resources"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_subnet_address_prefixes" {
  description = "Address prefixes for the AKS subnet"
  type        = list(string)
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_kubernetes_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
}

variable "aks_node_resource_group_name" {
  description = "The resource group for infrastructure resources (like AKS managed RG)"
  type        = string
}

variable "aks_default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
}

variable "aks_default_node_pool_vm_size" {
  description = "VM size for the default node pool"
  type        = string
}

variable "aks_default_node_pool_os_sku" {
  description = "OS SKU for the default node pool"
  type        = string
}

variable "aks_default_node_pool_os_disk_size_gb" {
  description = "OS disk size for the default node pool"
  type        = number
}

variable "aks_default_node_pool_minimum_node_count" {
  description = "Minimum node count for autoscaling"
  type        = number
}

variable "aks_default_node_pool_maximum_node_count" {
  description = "Maximum node count for autoscaling"
  type        = number
}

variable "aks_default_node_pool_availability_zones" {
  description = "Comma-separated availability zones for the node pool"
  type        = list(string)
}

variable "acr_name" {
  description = "Name of the Azure container registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU of the Azure container registry"
  type        = string
}

