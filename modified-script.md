```bash
az login
az account set -s $(az account list --query "[?name=='pat-int'].id" -o tsv)
az account show
az deployment group create --resource-group apim --template-file ./deploy/api-gateway.bicep --parameters resourceNamePrefix='apim'


az deployment group create --resource-group apim --template-file ./deploy/app.bicep --parameters resourceNamePrefix='apim' apiManagementName='apim-peterlil' selfHostedGatewayToken='GatewayKey api-gateway-on-container-apps&202212171145&FLZDlw5CH3K6riXY1+uRnkWDC0+7q3+v6EP9qL1rZDXQskeMLIK920/O9hMqxHalUAKiUPssK0Cg/+uwvHSlAg==' location='northeurope'



```
