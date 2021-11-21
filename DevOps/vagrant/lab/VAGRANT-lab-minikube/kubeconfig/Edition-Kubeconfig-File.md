Edition d' un kubeconfig file

Connexion depuis le serveur Minikube 
1- Creation d' un utilisateur "admin" dans le namespace "kubernetes-dashboard"
```sh
$ vi admin-user
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
$ kubectl apply -f admin-user.yml
```

2- Recuperation des informations pour constituer son kubeconfig_file {a remplacer par vos informations}
```sh
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: {cluster-ca}
    server: {server-dns}
  name: {cluster-name}
contexts:
- context:
    cluster: {cluster-name}
    user: {user-name}
  name: {context-name}
current-context: {context-name}
kind: Config
users:
- name: {user-name}
  user:
    token: {secret-token}
```

3- Pour recuperer les informations de votre serveur mais aussi par exemple du "certificate-authority-data"
```sh
$ kubectl config view --flatten --minify
```

4- Lister les nom des secrets keys pour un namespace precis d' un utilisateur par exemple "admin-user"
```sh
$ kubectl get secrets -n kubernetes-dashboard
```

5- Recuperation du {secret-token}
```sh
$ kubectl describe secrets admin-user-token-jhnhv -n kubernetes-dashboard
```
Exemple:
```sh
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCakNDQWU2Z0F3SUJBZ0lCQVRBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwdGFXNXAKYTNWaVpVTkJNQjRYRFRJeE1URXhPVEUwTVRBeU0xb1hEVE14TVRFeE9ERTBNVEF5TTFvd0ZURVRNQkVHQTFVRQpBeE1LYldsdWFXdDFZbVZEUVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTjFJClV2SlhnL0I0UkJOMWgzYmplOXpnV0NCRDRsTTNLcDYyOUZjcWppQXFuZ2RDUmhRTjFna1pPTENsaXYwNUxvOFoKaHpBaTVVdS9UcXhyc1BMRHAyRUVBRzV6Z1E3N2NiR3Z3OEFETWd5RE5SRmM4N2lIMlhIdzdsWld4OXRLQTJuTgpSVmgwaXBuem1ZaU05c3dUZHJUR0xER1ZUUllrZ0Q4SGxvTzYrUVVuRzBlM2FybUpNRXdweWRmRlVLU3E4ZnpVCk1JVzZQdWMzUEx4VDNXOVBIaktMQmRFN3Voay9vRjMzZUlWay9hMkx2NjdCRWNGdit3akZkRDBvTjRQSUp2NTQKxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
    server: https://10.0.2.15:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    user: admin-user
  name: minikube
current-context: minikube
kind: Config
users:
- name: admin-user
  user:
    token:  eyJhbGciOiJSUzI1NiIsImtpZCI6IlN1c2oyZ0I2M2VLbFd0MHdIaGpVODFKYWgxdS1TNlNKa29fallCNUU1VDQifQ.eyxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxy;)
```

Exemple si vous utilisez l' application Lens depuis votre PC Windows:
```sh
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCakNDQWU2Z0F3SUJBZ0lCQVRBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwdGFXNXAKYTNWaVpVTkJNQjRYRFRJeE1URXhPVEUwTVRBeU0xb1hEVE14TVRFeE9ERTBNVEF5TTFvd0ZURVRNQkVHQTFVRQpBeE1LYldsdWFXdDFZbVZEUVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTjFJClV2SlhnL0I0UkJOMWgzYmplOXpnV0NCRDRsTTNLcDYyOUZjcWppQXFuZ2RDUmhRTjFna1pPTENsaXYwNUxvOFoKaHpBaTVVdS9UcXhyc1BMRHAyRUVBRzV6Z1E3N2NiR3Z3OEFETWd5RE5SRmM4N2lIMlhIdzdsWld4OXRLQTJuTgpSVmgwaXBuem1ZaU05c3dUZHJUR0xER1ZUUllrZ0Q4SGxvTzYrUVVuRzBlM2FybUpNRXdweWRmRlVLU3E4ZnpVCk1JVzZQdWMzUEx4VDNXOVBIaktMQmRFN3Voay9vRjMzZUlWay9hMkx2NjdCRWNGdit3akZkRDBvTjRQSUp2NTQKxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
    server: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default
  name: minikube
contexts:
- context:
    cluster: minikube
    user: admin-user
  name: minikube
current-context: minikube
kind: Config
users:
- name: admin-user
  user:
    token:  eyJhbGciOiJSUzI1NiIsImtpZCI6IlN1c2oyZ0I2M2VLbFd0MHdIaGpVODFKYWgxdS1TNlNKa29fallCNUU1VDQifQ.eyxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxy;)
```

6- Test du kubeconfig file
```sh
kubectl get pods --kubeconfig {kubeconfig_file}
```