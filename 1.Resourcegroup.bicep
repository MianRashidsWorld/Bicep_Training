targetScope = 'subscription'

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: 'azbicepresourcegroup'
  location: 'northeurope'
}
