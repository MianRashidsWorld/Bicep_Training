resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'azbicep-dev-neu-asp1'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'azbicep-dev-neu-webapp1'
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'azbicep-dev-neu-asp1')
  }
}

resource appSetting 'Microsoft.Web/sites/config@2024-04-01' = {
  name: 'web'
  parent: webApplication
  properties: {
    appSettings: [
       {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appInsightsComponents.properties.InstrumentationKey
       }
       {
        name: 'key2'
        value: 'value2'
       }
    ]
  }
}

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'azbicep-dev-neu-webapp1-ai'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
