# Configurer les systèmes pour monter des systèmes de fichiers à la demande
Les utilisateurs ne peuvent utiliser aucun fichier ou répertoire dans un système de fichiers tant qu'il n'est pas correctement monté et disponible.
Nous avons monté des systèmes de fichiers locaux et les avons configurés pour qu'ils `/etc/fstab` soient montés au démarrage.
Nous allons expliquer comment se connecter à un partage Samba distant et configurer un système de fichiers distant à monter au démarrage.

- Installation de Samba

```bash
sudo yum install samba-client samba-common cifs-utils
```

- Connexion au serveur Samba

```bash
smbclient -L 192.168.1.122 # Ip du serveur samba
```

- Utilisation de l'utilisateur monuser 

```bash
smbclient//192.168.1.122/sambashare -U monuser
```

- Création d'un point de montage

```bash
sudo mkdir /mnt/samba
ls -alhtr
```

- Editer le crédentials pour notre utilisateur de samba

```bash
cd /mnt
sudo nano .smbcredentials
username=monuser
password=Linux123
sudo chmod 600 .smbcredentials
```

- Editer le fstab

```bash
sudo nano /etc/fstab
//192.168.1.122/sambashare /mnt/samba cifs credentials=/mnt/.credentials,defaults 0 0
```

- Monter notre point de montage vers notre partage

```bash
sudo mount -a
df -h
ls -alh samba/
```
