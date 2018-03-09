#!/bin/bash
kubernetes_release=${kubernetes_release:-v1.8.8}
minikube_release=${minikube_release:-v0.25.0}
helm_release=${helm_release:-v2.8.1}
mount_path=$(pwd)

curl -LO "https://storage.googleapis.com/kubernetes-release/release/${kubernetes_release}/bin/linux/amd64/kubectil"
curl -Lo minikube "https://storage.googleapis.com/minikube/releases/${minikube_release}/minikube-linux-amd64" && chmod +x minikube && sudo mv minikube /usr/local/bin/
curl -LO "https://storage.googleapis.com/kubernetes-helm/helm-${helm_release}-linux-amd64.tar.gz" && tar -zxvf "helm-${HELM_RELEASE}-linux-amd64.tar.gz" && sudo mv linux-amd64/helm /usr/local/bin/helm
minikube start --mount-string "${mount_path}/certificates":/home/docker/certificates --mount
eval $(minikube docker-env)
kubectl create -f daemonset.yaml
