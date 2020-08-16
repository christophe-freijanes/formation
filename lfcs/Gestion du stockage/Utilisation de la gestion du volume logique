#Gestion du stockage
##Utilisation de la gestion du volume logique
L'équipe de développement de notre organisation souhaite que l'une de ses stations de travail stocke environ 10 Go de données pour une nouvelle application Web.
Bien qu'il dispose actuellement de 10 Go d'espace de stockage non alloué, il est disponible sur deux disques séparés de 5 Go, /dev/xvdb et /dev/xvdc.
Nous avons décidé de tirer parti des fonctionnalités de Logical Volume Management (LVM) en combinant ces périphériques dans un groupe de volumes et en utilisant un volume logique nommé /dev/volgroup/datavol.
Ils nous ont demandé de monter en permanence environ 10 Go d'espace de stockage sur le répertoire appelé /mnt/data.

- Créez des partitions de type LVM Linux sur /dev/xvdb et /dev/xvdc pour utiliser tout l'espace
Démarrez un shell root interactif avec sudo.
fdisk permet de créer une nouvelle partition par défaut de type 8e sur /dev/xvdb et /dev/xvdc.
Créez le premier:

```bash
sudo -i
fdisk /dev/xvdb
```

Utilisez la commande n et choisissez toutes les valeurs par défaut pour créer une nouvelle partition:

```bash
Command (m for help): n
Partition Type: p
Partition number (1-4, default 1): Press Enter to accept the default
First sector: Press Enter to accept the default
Last sector: Press Enter to accept the default
```

Utilisez la commande t pour passer à 8e (Linux LVM):

```bash
Command (m for help): t
Selected partition 1
Hex code (type L to list all codes): 8e
Changed type of partition 'Linux' to 'Linux LVM'
```

Utilisez la commande w pour écrire les modifications dans la table de partition et quitter:

```bash
Command (m for help): w
```

Créez maintenant le second:

```bash
fdisk /dev/xvdc
```

Utilisez la commande n et choisissez toutes les valeurs par défaut pour créer une nouvelle partition:

```bash
Command (m for help): n
Partition Type: p
Partition number (1-4, default 1): Press Enter to accept the default
First sector: Press Enter to accept the default
Last sector: Press Enter to accept the default
```

Utilisez la commande t pour passer à 8e (Linux LVM):

```bash
Command (m for help): t
Selected partition 1
Hex code (type L to list all codes): 8e
Changed type of partition 'Linux' to 'Linux LVM'
```

Utilisez la commande w pour écrire les modifications dans la table de partition et quitter.
Le résultat est que les partitions /dev/xvdb1 et /dev/xvdc1 de type 8e ont été créées.

- Créez des volumes physiques avec les partitions LVM /dev/xvdb1 et /dev/xvdc1 et créez le groupe de volumes de groupes de volumes à l'aide de /dev/xvdb1
Initialisez les partitions LVM /dev/xvdb1 et en /dev/xvdc1 tant que volumes physiques avec pvcreate.
Inspectez les volumes physiques avec pvs et pvdisplay:

```bash
pvcreate /dev/xvdb1 /dev/xvdc1
pvs
pvdisplay
```

Utilisez vgcreate pour créer le volgroupgroupe de volumes à l'aide du /dev/xvdb1 volume physique.
Inspectez volgroup avec vgs et vgdisplay:

```bash
vgcreate volgroup /dev/xvdb1
vgs
vgdisplay
```

- Créer le datavol de volume logique en utilisant 3 Go d'espace et tempvol en utilisant 1 Go d'espace
Utilisez la commande lvcreate pour créer deux volumes logiques, un 3 Go nommé datavol et un 1 Go nommé tempvol.
Inspectez-les à l'aide des commandes lvs et lvdisplay:

```bash
lvcreate -n datavol -L3G volgroup
lvcreate -n tempvol -L1G volgroup
lvs
lvdisplay
```

- Supprimer /dev/volgroup /tempvol, étendre volgroup avec /dev/xvdc1, puis redimensionner /dev/volgroup/datavol pour utiliser tout l'espace dans le groupe de volumes
Utilisez lvremove pour vous débarrasser de tempvol, puis exécutez vgextendpour développer le groupe de volumes.
Créez un système de fichiers ext4 /dev/volgroup/datavol et montez-le dessus /mnt/data.
Utilisez lvresize pour étendre le volume logique datavol et le système de fichiers à la taille maximale possible.
Vérifiez tout par la suite à l'aide des commandes df et vgs:

```bash
lvremove /dev/volgroup/tempvol
Type 'y' and Enter to confirm 
vgs
vgextend volgroup /dev/xvdc1
vgs
vgdisplay
mkfs -t ext4 /dev/volgroup/datavol
mkdir /mnt/data
mount  /dev/volgroup/datavol /mnt/data
df -h /mnt/data
lvresize -r -L 9.99G /dev/volgroup/datavol
df -h
```

- Configurer le volume logique /dev/volgroup /datavol à monter sur /mnt/data de manière persistante
Démontez le /mnt/data répertoire avec la commande umount:

```bash
umount /mnt/data
```

Ajoutez la ligne suivante à /etc/fstab:

```bash
/dev/volgroup/datavol /mnt/data ext4 defaults 0 1
```

Utilisez un éditeur comme vim pour ajouter la ligne au fichier:

```bash
vim /etc/fstab
```

Montez l'appareil avec la commande mount. 
Utilisez df pour vérifier qu'il est monté:

```bash
mount -a
df -h /mnt/data
```
