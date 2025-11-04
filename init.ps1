$Env:KUBECONFIG = "D:\Clusters\cottage\talos\kubeconfig"

helm repo add argo https://argoproj.github.io/argo-helm
kubectl create namespace argocd
helm upgrade --install --namespace  argocd  argocd argo/argo-cd -f tmp\argocd.values.yaml
kubectl apply -f root.yaml

$base64 = kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($base64))

kubectl port-forward service/argocd-server -n argocd 8080:443

kubectl apply -f .\secrets

kubectl apply -f .\infra\auth-acmedns.yaml
kubectl apply -f .\infra\clusterissuer.yaml


kubectl resource-capacity --sort cpu.limit --util --pods

(New-TimeSpan -Start (Get-Date).Date -End (Get-Date).DateTime).TotalSeconds

Get-Date -UFormat %s

1715965221
1715965233

