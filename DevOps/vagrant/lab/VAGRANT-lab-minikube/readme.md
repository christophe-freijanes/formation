## INSTALLATION
1- Deploiement du dashboard
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
```
2- Verification de la creation des 2 pods
```sh
kubectl get pods -A
```
```sh
kubernetes-dashboard   dashboard-metrics-scraper-6b4884c9d5-v4z89   1/1     Running   0          30m
kubernetes-dashboard   kubernetes-dashboard-7b544877d5-m8jzk        1/1     Running   0          30m 
```

## CREATION ADMIN USER
1- Creation du folder
```sh
mkdir ~/dashboard && cd ~/dashboard
```
2- Creation du dashboard pour l'admin user
```sh
vi dashboard-admin.yaml
```
```sh
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```
```sh
kubectl apply -f dashboard-admin.yaml
```
3- Generation du token pour ce connecter
```sh
kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
```
## CREATION READ-ONLY USER

1- Creation du dashboard pour l'utilisateur read-only
```sh
vi dashboard-read-only.yaml
```
```sh
apiVersion: v1
kind: ServiceAccount
metadata:
  name: read-only-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
  labels:
  name: read-only-clusterrole
  namespace: default
rules:
- apiGroups:
  - ""
  resources: ["*"]
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - extensions
  resources: ["*"]
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - apps
  resources: ["*"]
  verbs:
  - get
  - list
  - watch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: read-only-binding
roleRef:
  kind: ClusterRole
  name: read-only-clusterrole
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: read-only-user
  namespace: kubernetes-dashboard
```
```sh
kubectl apply -f dashboard-read-only.yml
```
3- Generation du token pour ce connecter
```sh
kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount read-only-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
```
## ACCES AU DASHBOARD
Creation d'un cronjob
```sh
vi start-minikube-proxy
```
```sh
sudo kubectl proxy --address='0.0.0.0' –port=8001 --www=/home/vagrant/minikube --www-prefix=/minikube/
```
```sh
crontab -e
```
```sh
@reboot /usr/bin/sh /home/vagrant/dashboard/start-minikube-proxy.sh
```

Sources :
* [Techbeatly](https://www.techbeatly.com/2020/08/deploy-minikube-using-vagrant-and-ansible-on-virtualbox-infrastructure-as-code.html)
* [Upcloud](https://upcloud.com/community/tutorials/deploy-kubernetes-dashboard/)
