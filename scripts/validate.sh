#!/usr/bin/env bash
set -euo pipefail
echo "Cluster nodes:"
kubectl get nodes -o wide
echo
echo "Pods:"
kubectl get pods -o wide
echo
echo "Services:"
kubectl get services
echo
echo "Check nginx-service DNS from busybox (temporary pod):"
kubectl run test-pod --image=busybox --rm -it --restart=Never -- sh -c "nslookup nginx-service; wget -q -O- http://nginx-service || true"
echo
echo "Test PostgreSQL client (temporary pod):"
kubectl run psql-test --image=postgres:14-alpine --rm -it --restart=Never --   psql -h postgres-service -U testuser -d testdb -c '\l' || true
echo
echo "To test NodePort externally open: http://<NODE-IP>:30080"
