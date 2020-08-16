# Configurer les systèmes pour monter les systèmes de fichiers au démarrage ou pendant le démarrage
Les utilisateurs ne peuvent pas accéder aux données si un système de fichiers n'a pas été monté, donc un administrateur système Linux doit s'assurer que les systèmes de fichiers se montent correctement et sont accessibles.
Les systèmes de fichiers Linux ne sont pas comme ceux de Windows et nécessitent une planification et une réflexion pour déterminer ce qui doit être disponible au démarrage.
Nous examinerons le `/etc/fstab` fichier et verrons comment il est utilisé pour monter les systèmes de fichiers au démarrage.
Vous serez familiarisé avec le format du `/etc/fstab` fichier vous-même et pourrez configurer vos systèmes de fichiers pour qu'ils se montent correctement si nécessaire.

- Trouver l'UUID de son disque dur

```bash
sudo blkid | grep sdb
```

- Editer le fstab

```bash
sudo nano /etc/fstab
# Exemple de montage permanent
UUID=b11fea96-c15d-4950-af7b-f863781bf4ed /mnt/backup ext4 defaults 0 0
```

- Tester vos points de montage

```bash
sudo findmnt --verify
```

- Démonter un point de montage

```bash
sudo unmount /mnt/backup
lsblk
```

- Monter vos points de montage 

```bash
sudo mount -a
# Pour un point de montage en particulier
sudo mount /mnt/backup
lsblk
```
