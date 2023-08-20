
https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md

<!-- helm repo add jetstack https://charts.jetstack.io -->


<!-- helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.12.0 \
  --set installCRDs=true -->


helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller

helm upgrade  --install \
  --namespace actions-runner-system \
  --create-namespace \
  --set=authSecret.create=true \
  --set=authSecret.github_token=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 \
  --wait \
  actions-runner-controller actions-runner-controller/actions-runner-controller
