#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-apply.sh

logSummary() {
    echo ""
    echo "#####################################################"
    echo "Please find the below useful endpoints,"
    echo "JHipster Console - http://jhipster-console.default.k8s.hibuz.com"
    echo "#####################################################"
}

kubectl apply -f registry/
kubectl label namespace default istio-injection=enabled --overwrite=true
kubectl apply -f test/
kubectl apply -f gateway/
kubectl apply -f uaa/
kubectl apply -f messagebroker/
kubectl apply -f console/

logSummary
