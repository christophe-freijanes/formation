#!/bin/bash
USER=admin-user
kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount $USER -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode