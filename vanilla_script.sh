#!/bin/bash
kubernetes_release=${kubernetes_release:-v1.9.0}
minikube_release=${minikube_release:-v0.25.0}
helm_release=${helm_release:-v2.8.1}
mount_path=$(pwd)
driver_name=${driver_name:-kvm2}

curl -Lo kubectl "https://storage.googleapis.com/kubernetes-release/release/${kubernetes_release}/bin/linux/amd64/kubectl" && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
curl -Lo minikube "https://storage.googleapis.com/minikube/releases/${minikube_release}/minikube-linux-amd64" && chmod +x minikube && sudo mv minikube /usr/local/bin/
curl -LO "https://storage.googleapis.com/kubernetes-helm/helm-${helm_release}-linux-amd64.tar.gz" && tar -zxvf "helm-${helm_release}-linux-amd64.tar.gz" && sudo mv linux-amd64/helm /usr/local/bin/helm
minikube start --vm-driver ${driver_name} --mount-string "${mount_path}/certificates":/home/docker/certificates --mount
eval $(minikube docker-env)
kubectl create -f daemonset.yaml
