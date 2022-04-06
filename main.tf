
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


provider "kubernetes" {
  config_context_cluster   = "minikube"
  config_path = "~/.kube/config"
}


resource "helm_release" "example" {
  name  = "helm-${var.releaseName}-challenge"
  chart = "challenge/"

  values = [
    file("challenge/env/${var.releaseName}/values.yaml"),
  ]
}
