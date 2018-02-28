#!/bin/bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.8/bin/linux/amd64/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
minikube start --mount-string /home/ubuntu/projects/ovpn/certificates:/home/docker/certificates --mount
eval $(minikube docker-env)
docker build -t vpn:v1 .
kubectl create -f daemonset.yaml
