#!/bin/bash
if [ $1 == "master" ]
then
  # install dashboard k8s
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
  kubectl get pods -A
  sleep 30
  kubectl get pods -A
  kubectl apply -f /home/vagrant/dashboard/dashboard-admin.yaml
  kubectl apply -f /home/vagrant/dashboard/dashboard-read-only.yml
  kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
fi
echo
echo "The installation of centos-minikube is successfully completed"
echo "Connect to the centos-minikube after the last reboot"
shutdown -r
exit 0