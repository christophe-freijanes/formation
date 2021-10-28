# Gérer et configurer le stockage LVM Partie 1 - Créer LVM
La gestion du volume logique vous permet de joindre plusieurs disques physiques ensemble de manière à les présenter au système d'exploitation comme un seul périphérique.
Nous allons explorer comment partitionner des périphériques pour LVM, créer des volumes physiques, configurer les volumes logiques et créer les groupes de volumes.

## Préparation à la création d'un volume logique

- Création de la première partition Linux LVM

```bash
fdisk /dev/sdc
p # Print des partitions
n # Créer une partition
p # Partition primaire
# Entrée pour accepter les paramétres par défaut
First sector # Entrée
Last sector # +500M
p # Print des partitions
t # Permet de changer le type de partition
L # Pour lister les codes de partionnements
8e # Linux LVM
p # Print des partitions Type = Linux LVM
```

- Création de la seconde partition Linux LVM

```bash
p # Print des partitions
n # Créer une partition
p # Partition primaire
# Entrée pour accepter les paramétres par défaut
First sector # Entrée
Last sector # +500M
p # Print des partitions
t # Permet de changer le type de partition
2 # Pour choisir cette seconde partition
8e # Linux LVM
p # Print des partitions Type = Linux LVM
w
```

- Lister les partitions

```bash
lsblk
```

## Création à la création d'un volume logique

- Création des volumes physiques d'un volume de groupe

```bash
pvcreate /dev/sdc1 /dev/sdc2
```

- Afficher les volumes physiques d'un volume groupes crées

```bash
pvdisplay
```

- Création d'un volume de groupe

```bash
vgcreate vg01 /dev/sdc1 /dev/sdc2
```

- Afficher les volumes de groupes crées

```bash
vgdisplay
```

- Création d'un volume logique

```bash
lvcreate --name lv01 --size 992M vg01
```

Un volume logique ne pas être créée sans avoir créée un groupe de volume

- Afficher les volumes logiques crées

```bash
lvdisplay
```

- Créer & monter le volume logique

```bash
mkfs.ext4 /dev/vg01/lv01
cd /mnt
mkdir data
mount /dev/vg01/lv01 /mnt/data
ls -alh
```
