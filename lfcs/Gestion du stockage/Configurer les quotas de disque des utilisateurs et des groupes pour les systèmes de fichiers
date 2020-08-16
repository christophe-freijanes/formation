#Gestion du stockage
##Configurer les quotas de disque des utilisateurs et des groupes pour les systèmes de fichiers
L'espace disque est beaucoup moins cher aujourd'hui qu'auparavant, mais si vous avez beaucoup d'utilisateurs ou une solution très utilisée, vous constaterez peut-être que vous devez limiter la quantité de stockage utilisée par un utilisateur ou un groupe d'utilisateurs spécifique.
Les situations possibles incluent un utilisateur qui génère en permanence des rapports ou un utilisateur FTP anonyme qui télécharge continuellement des fichiers, nous devons donc contrôler leur utilisation du stockage.
Nous explorerons la limitation de l'utilisation par les utilisateurs et les groupes d'un périphérique de stockage par blocs à l'aide de la commande `quota` Linux.
Vous serez en mesure de définir des limites strictes et souples et de définir des périodes de grâce pour que les utilisateurs nettoient leurs fichiers.

- Installation du package quota
```bash
sudo apt install quota
```

- Rechercher les informations concernant l'installation des modules quota
```bash
find /lib/modules/`uname -r` -type f -name '*quota_v*.ko*'
```

- Editer le fstab pour permettre l'update d'un système avec quota
```bash
sudo nano /etc/fstab
# On édite notre point de montage
UUID=ajjdjkje... /mnt/data ext4 usrquota, grpquota 0 0
# Pour la prise en compte de nos modifications
sudo mount -o remount /mnt/data
# Vérification
sudo cat /proc/mounts | grep '/mnt/data'
```

- Vérifier avec quota
```bash
cd /mnt/datals -alh
sudo quotacheck -cugm /mnt/data
# Listons de nouveau pour voir que la vérification des quotas a été éffectué avec succées
ls -alh
```

- Transformer les quota et les activés pour notre systèmes
```bash
sudo quotaon -v /mnt/data
# La commande indique que les quotas des groupes et utilisateurs son maintenant actifs
```

- Fixer des linites de quota d'un utilisateur
```bash
# Nous pouvons ici fixer les limites
sudo edquota -u monuser
# Vérification des quotas
sudo quota -vs monuser
# Dessous "quota" cela indique la limite soft mais la vraie limite ce situe en dessous de "limit"
```

- Fixer des linites de quota d'un utilisateur en une commande
```bash
sudo setquota -u monuser2 150M 300M 0 0 /mnt/data
sudo quota -vs monuser2
```

- Fixer des linites de quota pour un groupe en une commande
```bash
sudo setquota -g mongrp 150M 300M 0 0 /mnt/data
sudo quota -vgs mongrp
```

- Afficher le rapport complet de vos quota
```bash
sudo repquota -asgu
```
