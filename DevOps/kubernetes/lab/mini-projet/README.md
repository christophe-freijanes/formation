##
![alt text](https://github.com/christophe-freijanes/formation/blob/formation/DevOps/kubernetes/lab/mini-projet/images/01.png)
##

## 1. OBJECTIF

##

* Creation d'un PV (volume persistant) de type local /mini-data/
* Creation dans un PVC rattachant l'application Wordpress dans le manifest "mysql-deployment.yml" au pv-local-1
* Edition d' un manifest de deploiement de Mysql contenant un service de type ClusterIP.
* Creation dans un PVC rattachant l'application Wordpress dans le manifest "wordpress-deployment.yml"
* Edition d'un deploiement Wordpress avec les variables d'env pour ce connecter a Mysql.
* Creation d'un service de type nodeport pour exposer le frontend de wordpress.
* Encodage de l'authetification aux ressources mysql et wordpress.
* Tests et connexion au site wordpress.
* Validation du mini-projet K8S.

##

## 2. CREATION DES VOLUMES PERSISTANTS - PV

##
1. Identification de la StorageClass

```sh
kubectl get storageclass
```
```sh
NAME                 PROVISIONER                RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard (default)   k8s.io/minikube-hostpath   Delete          Immediate           false                  4d8h
```

2. Edition du manifest local-pv-1

```sh
vi local-pv-1.yml
```

```sh
apiVersion: v1
kind: PersistentVolume
metadata:
  name: local-pv-1
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mini-data"
```

3. Creation de notre PV

```sh
kubectl apply -f local-pv-1.yml
```

```sh
persistentvolume/local-pv-1 created
```

##

## 3. CREATION DU DEPLOIEMENT - WORDPRESS

##

* Il sera composer d'un service de type NodePort, d'un PVC ratacher a l'application wordpress, ainsi que son manifest de deployment permettant la creation du conteneur frontend wordpress.

1. Edition du manifest wordpress-deployment

```sh
vi wordpress-deployment.yml
```

```sh
apiVersion: v1
kind: Service
metadata:
  name: wordpress
  labels:
    app: wordpress
spec:
  type: NodePort
  selector:
    app: wordpress
    tier: frontend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30008
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wp-pvc-01
  labels:
    app: wordpress
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
  labels:
    app: wordpress
spec:
  selector:
    matchLabels:
      app: wordpress
      tier: frontend
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: wordpress
        tier: frontend
    spec:
      containers:
      - image: wordpress:4.8-apache
        name: wordpress
        env:
        - name: WORDPRESS_DB_HOST
          value: wp-mysql
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass
              key: password
        ports:
        - containerPort: 8090
          name: wordpress
        volumeMounts:
        - name: wp-persistent-storage
          mountPath: /var/www/html
      volumes:
      - name: wp-persistent-storage
        persistentVolumeClaim:
          claimName: wp-pvc-01
```

##

## 4. CREATION DU DEPLOIEMENT - MYSQL

##

* Il sera composer d'un service de type ClusterIP, d'un PVC ratacher a l'application wordpress, ainsi que son manifest de deployment permettant la creation du conteneur mysql.

1. Edition du manifest mysql-deployment

```sh
vi mysql-deployment.yml
```

```sh
apiVersion: v1
kind: Service
metadata:
  name: wp-mysql
  labels:
    name: wordpress
spec:
  type: ClusterIP
  selector:
    app: wordpress
    tier: mysql
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc-01
  labels:
    app: wordpress
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wp-mysql
  labels:
    app: wordpress
spec:
  replicas: 1
  selector:
    matchLabels: 
      app: wordpress
      tier: mysql
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: wordpress
        tier: mysql
    spec:
      containers:
      - image: mysql:5.6
        name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass
              key: password
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-persistent-storage
        persistentVolumeClaim:
          claimName: mysql-pvc-01
```

##

## 5. CREATION DU SECRET - KUSTOMIZATION

##

* Ce manifest va nous permettre de s'authentifier a nos ressources Wordpress et Mysql avec un mot de passe encoder. Il nous permettra donc de faire le lien avec notre environnement Wordpress et Mysql.

1. Encodage du mot de passe

```sh
echo -n 'mon-mysql-pass' | base64
```

```sh
MTIzc29sZWls
```

2. Edition du manifest kustomization

```sh
vi kustomization.yaml
```

```sh
resources:
  - mysql-deployment.yml
  - wordpress-deployment.yml
secretGenerator:
- name: mysql-pass
  literals:
  - password=MTIzc29sZWls
```

##

## 6. CREATION DU MINI-PROJET

##

1. Execution de notre fichier permettant la creation de notre mini-projet "Wordpress-Mysql"

```sh
kubectl apply -k ./
```

```sh
secret/mysql-pass-7c2fh89g8b created
service/wordpress created
service/wp-mysql created
persistentvolumeclaim/mysql-pvc-01 created
persistentvolumeclaim/wp-pvc-01 created
deployment.apps/wordpress created
deployment.apps/wp-mysql created

```

##

## 7. VALIDATION DU MINI-PROJET

##

1. Verification de nos services (svc)

### SERVICES

```sh
kubectl describe svc
```

```sh
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Name:                     wordpress
Namespace:                default
Labels:                   app=wordpress
Annotations:              <none>
Selector:                 app=wordpress,tier=frontend
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.105.49.166
IPs:                      10.105.49.166
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30008/TCP
Endpoints:                172.17.0.13:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Name:              wp-mysql
Namespace:         default
Labels:            name=wordpress
Annotations:       <none>
Selector:          app=wordpress,tier=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.100.251.81
IPs:               10.100.251.81
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         172.17.0.12:3306
Session Affinity:  None
Events:            <none>
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

```

2. Verification de nos volumes pv et pvc

### PV

```sh
kubectl describe pv local-pv-1
```

```sh
Name:            local-pv-1
Labels:          type=local
Annotations:     pv.kubernetes.io/bound-by-controller: yes
Finalizers:      [kubernetes.io/pv-protection]
StorageClass:    manual
Status:          Bound
Claim:           default/mysql-pvc-01 #<-- le pv est bien ratachee au pvc
Reclaim Policy:  Retain
Access Modes:    RWO
VolumeMode:      Filesystem
Capacity:        20Gi
Node Affinity:   <none>
Message:
Source:
    Type:          HostPath (bare host directory volume)
    Path:          /mini-data
    HostPathType:
Events:            <none>
```
### PVC

```sh
kubectl get pvc
```

```sh
NAME           STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
mysql-pvc-01   Bound    local-pv-1                                 20Gi       RWO            standard       9m41s
wp-pvc-01      Bound    pvc-9c727544-6171-4509-8bb0-d611e00fa627   5Gi        RWO            standard       9m41s
```

```sh
kubectl get pv
```

```sh
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
local-pv-1                                 20Gi       RWO            Retain           Bound    default/mysql-pvc-01   standard                10m
pvc-9c727544-6171-4509-8bb0-d611e00fa627   5Gi        RWO            Delete           Bound    default/wp-pvc-01      standard                10m
```

3. Verification de la creation des pods

### PODS

```sh
kubectl get pods
```

```sh
NAME                         READY   STATUS    RESTARTS   AGE
wordpress-54b85f6578-mb5qk   1/1     Running   0          10m
wp-mysql-754fb6cff7-4bbkk    1/1     Running   0          10m
```

### AUTRES VERIF

1. Verification de la persistante des donnees
```sh
$ ls -alh /mini-data/
total 173M
drwxr-xr-x   5 polkitd root   131 Nov 24 22:37 .
dr-xr-xr-x. 22 root    root  4.0K Nov 24 22:37 ..
-rw-rw----   1 polkitd input   56 Nov 24 22:37 auto.cnf
-rw-rw----   1 polkitd input  76M Nov 24 22:41 ibdata1
-rw-rw----   1 polkitd input  48M Nov 24 22:41 ib_logfile0
-rw-rw----   1 polkitd input  48M Nov 24 22:37 ib_logfile1
drwx------   2 polkitd input 4.0K Nov 24 22:37 mysql
drwx------   2 polkitd input 4.0K Nov 24 22:37 performance_schema
drwx------   2 polkitd input 4.0K Nov 24 22:40 wordpress
```
2. Test depuis votre navigateur

```sh
http://<LOCALHOST>:30008/
```
![alt text](https://github.com/christophe-freijanes/formation/blob/formation/DevOps/kubernetes/lab/mini-projet/images/index.png)
#

Sources : [AVENIR](https:///repositories)
