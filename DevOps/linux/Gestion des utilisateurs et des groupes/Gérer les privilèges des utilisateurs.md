# Gérer les privilèges des utilisateurs
Qui peut accéder à vos serveurs et que peuvent-ils exécuter une fois sur le système?
En tant qu'administrateur système Linux, que devez-vous faire?
Nous examinerons le `/etc/security/access.conf` fichier et la manière dont nous pouvons l'utiliser pour contrôler qui a accès à distance.

- Editer les access de permission

```bash
nano /etc/security/access.conf
```

- Changer de groupe et les permissions pour les utilisateurs

```bash
id
cd /usr/bin
ls -alh
# Changer le groupe qui peut exécuter zcmd
sudo chgrp zadmins zcmd
# Changer les permissions notamment d'exécution
sudo chmod 754 zcmd
```
