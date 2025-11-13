#!/usr/bin/env bash
set -euo pipefail
echo "Applying manifests..."
kubectl apply -f manifests/nginx-pod.yaml
kubectl apply -f manifests/nginx-deployment.yaml
kubectl apply -f manifests/nginx-service.yaml
kubectl apply -f manifests/nginx-nodeport.yaml
kubectl apply -f manifests/postgres.yaml
echo "Done. Wait a few seconds and run ./scripts/validate.sh"
