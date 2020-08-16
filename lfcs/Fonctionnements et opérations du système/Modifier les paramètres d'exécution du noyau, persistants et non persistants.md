# Modifier les paramètres d'exécution du noyau, persistants et non persistants
Le noyau Linux contrôle presque toutes les parties du système d'exploitation.
La possibilité de modifier les paramètres du noyau à la volée peut permettre à un administrateur système Linux de tester et de valider les modifications que vous pensez avoir besoin de mettre à jour avant de rendre les modifications permanentes.
Nous allons voir comment afficher et modifier les paramètres d'exécution du noyau de manière temporaire ou permanente.
Vous devriez être à l'aise pour visualiser les paramètres et effectuer vous-même ces modifications.

## Non-persistant
- Lister la configuration de son système

```bash
sudo sysctl -a
```

- Vérifier les paramètres d'un composant du kernel

```bash
sysctl dev.cdrom.autoclose
```

- Lister les repertoires de votre kernel

```bash
cd /proc/sys
ls -al
ls dev
# On voit par exemple que dev et bien le repertoires de cdrom
```

- Détail d'un repertoire de configuration de votre kernel

```bash
cd /proc/sys/dev/cdrom
ls -al
cat autoclose
# La valeur est 1
```

- Changer les paramètres d'un composant du kernel avec la commande sysctl

```bash
sudo sysctl -w dev.cdrom.autoclose=0
cd /proc/sys/dev/cdrom
ls -al
cat autoclose
# La valeur est après changement 0
```

- Changer les paramètres d'un composant du kernel avec un éditeur

```bash
sudo nano /proc/sys/dev/cdrom/autoclose
# On remplace 0 par 1
cat autoclose
# La valeur est après changement 1
```

## Persistant
Pour rendre notre changement persistant après un redémarrage, nous devons éditer les fichiers de configuration principaux.

- A faire avant toutes modifications

```bash
cd /etc/sysctl.d
ls -al
cat README
# Le readme contient un resumé simple de nos fichiers de configuration
```

- Edition d'un fichier de configuration

```bash
sudo nano 10-network-security.conf
# Toujours commenter ses rajouts
# Added user to enable IPv4 forward
net.ipv4.ip_forward=1
```

- Appliquer les changements de configuration

```bash
sudo service procps start
reboot
# Une fois redémarrer le changement de configuration appliqué il sera persistant
```
