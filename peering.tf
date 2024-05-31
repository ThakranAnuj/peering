resource "azurerm_virtual_network_peering" "self" {
  name                      = "self-to-31may2"
  resource_group_name       = "keyvault"
  virtual_network_name      = "self-hosted-agent-vnet"
  remote_virtual_network_id = "/subscriptions/0fd09a32-d5ee-4196-a474-80c1d8a8cd3f/resourceGroups/31may-2/providers/Microsoft.Network/virtualNetworks/31may-2"
}
resource "azurerm_virtual_network_peering" "may31" {
  name                      = "31may2-to-self"
  resource_group_name       = "31may-2"
  virtual_network_name      = "31may-2"
  remote_virtual_network_id = "/subscriptions/0fd09a32-d5ee-4196-a474-80c1d8a8cd3f/resourceGroups/keyvault/providers/Microsoft.Network/virtualNetworks/self-hosted-agent-vnet"

}