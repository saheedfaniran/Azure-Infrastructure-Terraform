resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location
}
#Defining the resource resource_group_name

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}
#Creating role assignments, so that AKS cluster can download Docker Image from ACR

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}
#Creating Azure container registry for saving Docker Images, admin pass disabled for no one to get access

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.cluster_name
#Defining the creation of Kubernetes AKS Cluster

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "standard_a2_v2"
    type                = "VirtualMachineScaleSets"
    zones = []
    auto_scaling_enabled = false
    }
#Defining the AKS cluster nodes, with standard VM size and VM scale set with 3 Availabilty zones 

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }
}