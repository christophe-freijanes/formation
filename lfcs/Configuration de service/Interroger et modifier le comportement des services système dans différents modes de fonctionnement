#Configuration de service
##Interroger et modifier le comportement des services système dans différents modes de fonctionnement
La commande `systemctl` peut faire plus que simplement démarrer et arrêter des services, allons plus loin.
Nous verrons comment utiliser `systemctl` pour afficher les paramètres de service, afficher les dépendances et créer une configuration de remplacement pour un fichier.
Vous pourrez utiliser `systemctl` plus que le démarrage et l'arrêt de services.

- Afficher les informations d'un service
```bash
sudo systemctl cat apache2
```
On constate 3 sections Unit, Service et Install dans l'entrée du service
[Unit]
Le service Apache une fois toutes les cibles répertoriées, il fera appel à la valeur After=...
[Service]
Type= C'est le type d'exécution du service lorsqu'il génère un processus enfant, les exécutions peuvent commençer.
ExecStart= Chemin complet de la commande pour démarrer le service
ExecStop= Chemin complet de la commande pour stopper le service
ExecReload= Chemin complet de la commande pour le reload du service
PrivateTmp= true Apache a cette option pour redémarrer son service une fois une valeur atteinte
 Indique les circonstances dans lesquelles systemd tentera de redémarrer

[Install]
WantedBy=multi-user.target
Indication de comment l'unité de service dit être activée dans notre cas Apache est activé pour une cible multi-utilisateur

Si on regarde plus bas au niveau de la sortie
On constate que Apache à un fichier de remplacement.
# /lib/systemd/system/apache2...
Nous pouvons créée notre propre fichier de remplacement

- Création de notre fichier de remplacement
```bash
sudo systemctl edit cups
# Mettre cette valeur et enregistrer
Restart=on-abort
```

- Vérification de notre service cups
```bash
sudo systemctl cat cups
# Nous devons voir notre création de remplacement
# /etc/systemd/system/cups.service.d/override.conf
Restart=on-abort
```

- Suppression de notre fichier de remplacement
```bash
sudo rm -r /etc/systemd/system/cups.service.d/
# Pour la prise en compte de nos modifications
sudo systemctl daemon-reload
```

- Vérification de notre service cups
```bash
sudo systemctl cat cups
# Nous devons voir qu'il n'y a plus notre fichier de remplacement
```

- Editer le fichier complet d'un service
```bash
sudo systemctl edit --full cups
```
Ne pas oublier qu'après chaque changement le daemon doit être recharger ainsi que le service modifié.

- Vérifier les dépendances d'un service
```bash
sudo systemctl list-dependencies cups
```

- Vérifier l'état de tous les services de son système
```bash
sudo systemctl list-units --type=service
```

- Vérifier l'état de tous les services de son système uniquement "inactif"
```bash
sudo systemctl list-units --type=service --state=inactif
```

- Vérifier l'état de tous les services de son système uniquement "actif"
```bash
sudo systemctl list-units --type=service --state=actif
# Depuis la colone SUB on peut voir les services running et exited
```
