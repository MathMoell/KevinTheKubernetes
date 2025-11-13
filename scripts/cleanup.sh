#!/usr/bin/env bash
set -euo pipefail
echo "Deleting deployments, services, secrets..."
kubectl delete deployment nginx-deploy --ignore-not-found
kubectl delete pod nginx-yaml --ignore-not-found
kubectl delete service nginx-service nginx-nodeport postgres-service --ignore-not-found
kubectl delete deployment postgres --ignore-not-found
kubectl delete secret postgres-secret --ignore-not-found
kubectl delete pod psql-test --ignore-not-found
echo "Cleanup done."
