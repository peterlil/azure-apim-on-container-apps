kubectl create secret generic k8s-token --from-literal=value="GatewayKey k8s&202212171240&OpEUFzhslH0PNyuV/R2LwA5/4jr4N3h1oLw4zX3kxzybvmExUAW6CJZ37sCYfX8FKtGmQBij1kP0Z8fBqyQ8fw=="  --type=Opaque  --namespace=shgw
kubectl apply -f deploy-container.yml


curl https://20.166.200.215/api/echo/resource?param1=sample