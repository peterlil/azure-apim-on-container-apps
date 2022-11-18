param location string = resourceGroup().location
param resourceNamePrefix string = 'apim-container-apps'
param apiManagementName string
param selfHostedGatewayName string = 'api-gateway-on-container-apps'

@secure()
param selfHostedGatewayToken string

// Infrastructure
module infrastructure 'modules/infrastructure.bicep' = {
  name: 'infrastructure'
  params: {
    location: location
    logAnalyticsWorkspaceName: '${resourceNamePrefix}-container-app-logs'
  }
}

// Container App Landscape
module containerLandscape 'modules/container-landscape.bicep' = {
  name: 'container-landscape'
  params: {
    location: location
    containerEnvironmentName: '${resourceNamePrefix}-container-landscape'
    apiGatewayContainerAppName: '${resourceNamePrefix}-api-gateway'
    apiManagementName: apiManagementName
    selfHostedGatewayToken: selfHostedGatewayToken
    logAnalyticsWorkspaceId: infrastructure.outputs.logAnalyticsWorkspaceId
  }
  dependsOn: [
    infrastructure
  ]
}
