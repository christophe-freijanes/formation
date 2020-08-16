#Gestion du stockage
##Création et montage d'un système de fichiers chiffré

L'un des développeurs de notre organisation va travailler sur un serveur avec des données sensibles qui est couvert par diverses réglementations de conformité.
Notre politique de sécurité d'entreprise stipule que les informations utilisateur doivent se trouver sur des partitions chiffrées.
Nous allons créer une nouvelle partition à partir d'un disque supplémentaire provisionné sur ce système, d'une taille de 5 Go.
Une fois que nous avons créé la partition, nous devrons prendre des mesures pour sécuriser le contenu qui y sera placé.
En utilisant les étapes de cryptage appropriées, nous formaterons le système de fichiers et fournirons la configuration nécessaire pour le rendre disponible avec les bonnes commandes `cryptsetup` de cryptage / décryptage en utilisant la phrase de passe `TALK3nkrpTED`.
Nous ne pouvons pas configurer cette partition pour qu'elle soit montée au démarrage.
Il devra rester un processus de montage / démontage manuel.
Le développeur a demandé que le point de montage soit un répertoire appelé `/mnt/keys`.
Une fois que nous avons vérifié le travail de chiffrement et de déchiffrement et que nous avons protégé le système de fichiers, nous pouvons le remettre à l'équipe de développement.

REMARQUE: 
le périphérique de bloc de laboratoire est devenu /dev/nvme1n1.
Dans le laboratoire, la partition /dev/nvme1n1p1 est créée sur le périphérique bloc /dev/nvme1n1.

- Installer le progiciel `cryptsetup`
Utilisez yumpour installer le package `cryptsetup`:
```bash
sudo -i
yum -y install cryptsetup
```

- Créer une partition en utilisant tout l'espace sur le périphérique / dev / xvdg
Utilisez fdiskpour créer une nouvelle partition par défaut:
```bash
fdisk /dev/nvme1n1
```

Appuyez sur n et utilisez toutes les valeurs par défaut pour créer une nouvelle partition:

```bash
Command (m for help): n
Partition Type: p
Partition number (1-4, default 1): Press Enter to accept the default
First sector: Press Enter to accept the default
Last sector: Press Enter to accept the default
```

Appuyez sur w pour écrire les modifications dans la table de partition et quitter:

```bash
Command (m for help): w
```

- Utilisez cryptsetup luksFormat pour formater la partition à chiffrer
Formatez la partition /dev/nvme1n1p1 à chiffrer avec la phrase de passe TALK3nkrpTED :

```bash
cryptsetup -y luksFormat /dev//dev/nvme1n1p1
```

- Ouvrez le périphérique chiffré, créez un système de fichiers ext4, fermez le périphérique chiffré, puis créez le répertoire / mnt / keys
Utilisez cryptsetup luksOpenpour déchiffrer le périphérique et afficher son lien symbolique dans le /dev/mapperrépertoire avec la lscommande.
Utilisez mkfspour créer un système de fichiers ext4 et mkdirpour créer le /mnt/keysrépertoire:

```bash
cryptsetup luksOpen /dev/nvme1n1p1 cryptvol
```

Utilisez la phrase secrète TALK3nkrpTED :

```bash
ls -l /dev/mapper
mkfs -t ext4 /dev/mapper/cryptvol
cryptsetup luksClose cryptvol
mkdir /mnt/keys/
```

- Démontrez l'utilisation quotidienne de la partition chiffrée en l'ouvrant, en la montant, en y accédant, en la démontant et en la fermant
Pour une utilisation quotidienne, exécutez cryptsetup(using luksOpen) pour décrypter la partition et la luksClosecrypter.
Lorsque la partition est déchiffrée, elle peut être montée et doit être démontée avant d'être fermée ou chiffrée.
Utilisez touchpour créer un /mnt/keys/accessfichier et lspour l'afficher:

```bash
cryptsetup luksOpen /dev/nvme1n1p1 cryptvol
```
Utilisez la phrase secrète TALK3nkrpTED, puis:

```bash
mount /dev/mapper/cryptvol /mnt/keys
touch /mnt/keys/access
ls -l /mnt/keys/
umount /mnt/keys
cryptsetup luksClose cryptvol
```
