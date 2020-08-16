#Gestion du stockage
##Créer et configurer des systèmes de fichiers
«Tout dans Linux est un fichier», donc créer des systèmes de fichiers sains pour répondre aux besoins d'utilisation est une tâche importante pour tout administrateur système Linux.
Nous avons créé des systèmes de fichiers dans le cadre du flux de travail, mais nous nous concentrerons sur la création de systèmes de fichiers de différents types, les montons et parlerons de leur ajout `/etc/fstab` pour les rendre disponibles au démarrage.

Imaginons que depuis notre drive sdc nous avons 3 partitions sdc1, sdc2 & sdc3

- Création d'un point de montage
```bash
cd /mnt
sudo mkdir btrfs exfat ext4
ls -alhtr
```

- Création de notre fs btrfs
```bash
cd /mnt
sudo mkfs.btrfs /dev/sdc1
ls -alhtr
sudo mount /dev/sdc1 /mnt/btrfs
df -h
lsblk -f
```

- Création de notre fs exfat
```bash
cd /mnt
sudo mkfs.exfat /dev/sdc2
ls -alhtr
sudo mount /dev/sdc2 /mnt/exfat
df -h
lsblk -f
```

- Création de notre fs ext4
```bash
cd /mnt
sudo mkfs.ext4 /dev/sdc3
ls -alhtr
sudo mount /dev/sdc3 /mnt/ext4
df -h # df -Th
lsblk -f
```

- Vérifier l'intégrité de ses partitions monté dans /dev/sdc
```bash
sudo mount | grep "^/dev"
```

- Editer le fstab
```bash
nano /etc/fstab
/dev/sdc1 /mnt/btrfs defaults 0 0
/dev/sdc2 /mnt/exfat defaults 0 0
/dev/sdc3 /mnt/ext4 defaults 0 0
```
