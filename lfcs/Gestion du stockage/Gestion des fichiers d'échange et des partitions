#Gestion du stockage
##Gestion des fichiers d'échange et des partitions
L'administrateur système principal a remarqué que nos applications se bloquaient en raison d'erreurs de mémoire insuffisante (MOO) causées par une mémoire disponible insuffisante.
On nous a demandé de créer une partition d'échange de 1 Go et un fichier d'échange de 512 Mo qui persisteront après le redémarrage pour résoudre ce problème.
Nous devrions utiliser `fdisk` pour créer une partition de type swap de 1 Go, la formater avec `mkswap`, ajouter une entrée `/etc/fstab` et l'utiliser `swapon` pour l'activer de manière persistante.
On nous a également demandé de créer un fichier d'échange de 512 Mo.
En utilisant l'utilitaire dd, nous remplirons le fichier avec zéro octet du fichier /dev/zero.
Ce fichier d'échange doit être appelé /root/extra.swp.
Bien que les autorisations par défaut de 0644 fonctionnent sur ce fichier, nous devons changer l'autorisation avec chmod en 0600, comme recommandé par la commande swapon et pour de bonnes pratiques de sécurité.
Ensuite, nous ajouterons une entrée `/etc/fstab` et utiliserons la commande `swapon` pour activer le fichier d'échange de manière persistante.

# Créer une partition d'échange persistante de 1 Go
À l'aide de fdisk, créez la partition d'échange:

```bash
sudo -i
fdisk /dev/xvdg
```

Appuyez sur ce qui suit pour créer la partition:

- n pour une nouvelle partition
- Entrez pour sélectionner le type par défaut (principal)
- Entrez pour le premier secteur par défaut
- + 1G pour la taille de la partition
- t pour changer le type
- L pour lister les types
- 82 pour Linux Swap
- w pour écrire les modifications et quitter

Exécutez mkswap pour formater la partition:

```bash
mkswap /dev/xvdg1
```

Ajoutez une entrée à /etc/fstab:
```bash
/dev/xvdg1   none     swap    defaults        0 0
```

Vérifiez que la partition d'échange est activée:

```bash
swapon -s
swapon -a
swapon -s
```

# Créer un fichier d'échange persistant de 512 Mo
Utilisez la ddcommande pour créer un /root/extra.swpfichier de 512 Mo :

```bash
dd if=/dev/zero of=/root/extra.swp bs=1M count=512
```

Formatez et activez le /root/extra.swapen exécutant mkswap:

```bash
mkswap /root/extra.swp
swapon /root/extra.swp
```

Définissez des autorisations 0600 plus sécurisées à l'aide de la commande chmod:

```bash
chmod 0600  /root/extra.swp
ls -l /root/extra.swp
```

Ajoutez une entrée à /etc/fstab pour activer le fichier d'échange:

```bash
/root/extra.swp none swap defaults 0 0
```

Activez l'entrée du fichier d'échange:

```bash
swapoff /root/extra.swp
swapon -a
swapon -s
```
