# Répertorier, créer, supprimer et modifier des partitions de stockage physique
Les systèmes modernes basés sur les données nécessitent aujourd'hui de plus en plus de stockage pour fournir les services pour lesquels ils ont été conçus, et c'est à l'administrateur système Linux de savoir quel stockage est disponible et comment le gérer.
Nous allons utiliser `fdisk` et `parted` partitionner les périphériques de bloc dur et devenir familiers en repartitionnant les périphériques de stockage en bloc.
Vous devriez être familiarisé avec le partitionnement et la modification du stockage par blocs, mais n'oubliez pas de toujours sauvegarder les données avant d'apporter des modifications.

## LSBLK
- Lister les blocs

```bash
lsblk
```

## FDISK
- Création d'une nouvelle partition

```bash
sudo fdisk /dev/sdb
# p permet de lister les partitions
# utiliser m pour vous aider
```

- Supprimer une partition

```bash
sudo fdisk /dev/sdb
# d pour delete votre partition
# Choisir le numéro de votre partition à supprimer
# w pour quitter et écrire vos modifications
lsblk
```

## parted
- Création d'une nouvelle partition

```bash
sudo parted /dev/sdb
print
# help permet de voir toutes les possibilitées qu'offre parted
mkpart
Start? # Définir la taille de début ex: 801 Mb
End? # Définir la taille de fin ex: 901 Mb
quit
```

- Redimensionner une partition

```bash
sudo parted /dev/sdb
(parted)resizepart
Partition number ? 2
End ? [901MB]? 1024
(parted) print
(parted) quit
lsblk
```
