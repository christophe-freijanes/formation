#Gestion du stockage
##Configurer et gérer l'espace d'échange
L'espace de swap est un fichier ou une partition spéciale formaté pour permuter l'espace dans le fichier ou la partition avec de la mémoire sur le système.
Cela permet au noyau Linux de déplacer la mémoire utilisée par les processus inactifs hors de la RAM vers l'espace de swap, afin que d'autres processus actifs puissent utiliser cette RAM.
Nous aborderons ce qu'est le swap, la quantité de swap dont votre système aura besoin, comment activer et désactiver le swap, et où et comment le swap est défini sur le système.
Vous devriez pouvoir créer des fichiers d'échange et les activer ou les désactiver selon vos besoins.

- Lire le fstab
```bash
cat /etc/fstab
```

- Identifier votre swap
```bash
ls -alh /
```

- Informations en détail de votre swap
```bash
swapon --show
free
htop
```

- Désactiver le swap
```bash
sudo swapoff -a
swapon --show
```

- Activer le swap
```bash
sudo swapon -a
swapon --show
```

- Création de deux swap
```bash
sudo swapoff -a
sudo fallocate -l 1G /swapfile2
sudo dd if=/dev/zero of=swapfile3 bs=1024 count=1048576
ls -alhtr /
sudo chmod 600 /swapfile2
sudo chmod 600 /swapfile3
sudo mkswap /swapfile2
sudo mkswap /swapfile3
sudo swapon /swapfile2
sudo swapon /swapfile3
swapon --show
```

- Pour rendre permanent les paramétrages éditer le fstab

