# Créer et gérer des périphériques RAID
LVM peut offrir la redondance via les miroirs et la vitesse grâce au striping, mais il n'offre pas les deux comme RAID 5, 6 ou 10. LVM offre également l'avantage de redimensionner les périphériques.
Nous allons parler de RAID (Redundant Array of Independent Disks), qui est une autre option qui combinera les disques et les présentera comme un seul périphérique.
Mais il offre également d'autres fonctionnalités, telles que la redondance, pour garantir la fonctionnalité et la stabilité des fichiers / systèmes de fichiers. 
Nous utiliserons `fdisk`, `mkfs` et `mdadm` pour combiner plusieurs disques dans une matrice RAID logicielle.

- Création d'un RAID notre disque /dev/sdc

```bash
fdisk /dev/sdc
n
p
entrée
entrée
+500M # Création d'une partition de 500M
t
L # Lister les Hex code
fd # Linux raid auto
n
p
entrée
entrée
+500M # Création d'une partition de 500M
t
fd
p
w
```

- Création d'un RAID 0

```bash
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sdc1 /dev/sdc2
```

- Vérifié les RAID

```bash
cat /proc/mdstat
```

- Informations détaillées d'un RAID

```bash
mdadm --detail /dev/md0
```

- Monter son RAID sur son système

```bash
mkfs.ext4 /dev/md0
mkdir /mnt/raid
mount /dev/md0 /mnt/raid
ls -alhtr /mnt/raid
```

- Informations sur le RAID connaitre son UUID

```bash
mdadm --detail --scan
```

- Configurer le fichier mdadm.conf

```bash
nano /etc/mdadm/mdadm.conf
# Copier les informations de cette commande mdadm --detail --scan à la fin de votre fichier de configuration
mdadm --assemble --scan
update-initramfs -u
```

- Editer le fstab

```bash
sudo nano /etc/fstab
/dev/md0 /mnt/raid ext4 defaults,nofail,discard 0 0
mdadm --detail /dev/md0
```

- Rajouter une partition

```bash
mdadm /dev/md0 --add /dev/sdc4
```
