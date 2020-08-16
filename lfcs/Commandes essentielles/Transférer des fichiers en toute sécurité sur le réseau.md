#Commandes essentielles
##Transférer des fichiers en toute sécurité sur le réseau
L'administrateur système doit notamment transférer des fichiers entre les systèmes.
Mais l'envoi de fichiers sur un réseau peut être un problème de sécurité, nous devons donc crypter les choses en utilisant les outils disponibles avec SSH afin de garder nos données en sécurité pendant leur transit.
Cette activité nous familiarisera avec les transferts de fichiers sécurisés à l'aide d'outils basés sur SSH, comme `scp` et `rsync`.
Une fois cette activité terminée, nous saurons quand copier des fichiers ou les synchroniser, et comprendre la différence entre "push" et "pull" les transferts de fichiers sur le réseau en toute sécurité.

#Push copy d'un dossier du serveur1 au serveur2
```bash
scp -rp /opt/myapp root@serveur2:/opt 
```

#Pull copy d'un dossier du serveur2 vers serveur1
```bash
scp -rp root@serveur2:/opt/myapp /opt 
```

#Push copy avec rsync d'un dossier du serveur1 au serveur2
```bash
rsync -aP /opt/myapi server2:/opt
```

#Pull copy avec rsync d'un dossier du serveur2 au serveur1
```bash
rsync -aP server2:/opt/myapi /opt
```

#Liste récursivement le répertoire opt sur server1 et server2
- Utilisez-le ls -lR /opt/ localement server1, puis exécutez-le à distance server2 avec ssh:
```bash
ls -lR /opt
ssh server2 ls -lR /opt
```

#Copiez en toute sécurité le répertoire /opt/myapp du serveur1 vers le répertoire /opt du serveur2
- Maintenant , nous allons utiliser scpla copie récursive /opt/myappsur server1dans /optle server2. L' -roption le rend récursif et lui -ppermet de conserver les horodatages et les autorisations. 
Puisque nous devons être connectés server1, nous pouvons omettre la partie hôte du répertoire source:
```bash
scp -rp /opt/myapp server2:/opt
```

#Synchroniser le répertoire /opt/myapi de server2 avec server1
- Nous pouvons utiliser la commande rsync pour extraire le /opt/myapi répertoire server2 dans /opt sur le server1:
```bash
rsync -aP server2:/opt/myapi /opt
```

#Vérifiez que les répertoires /opt/myapp et /opt/myapi sont identiques sur serveur1 et serveur2
```bash
ls -lR /opt
ssh server2 ls -lR /opt
rsync -naP /opt/ server2:/opt
```
