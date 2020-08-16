# Créer, gérer et diagnostiquer les autorisations avancées du système de fichiers
Pour répondre à des exigences d'autorisation et / ou à des situations inhabituelles, un administrateur système Linux dispose d'options supplémentaires: le sticky bit `setgid`, et `setuid`.
Celles-ci ont été abordées dans une leçon précédente, mais aujourd'hui, la discussion se concentrera sur l'objectif de chaque type d'autorisation.
Nous utiliserons `chmod` pour définir ces autorisations supplémentaires, puis nous verrons comment trouver des fichiers et des répertoires avec ces autorisations définies.

- Création d'un fichier que l'utilisateur courant peut, modifier, supprimer...

```bash
cd /opt/perms
ls -larth
touch file1
ls -larth
rm file1
```

- Création d'un fichier que seul l'utilisateur root peut, modifier, supprimer...

```bash
cd /opt/perms
ls -larth
sudo touch rootfile1
ls -larth
rm rootfile1
```

- Changer les permissions d'un fichier

```bash
sudo chmod 644 rootfile1
sudo chown :docker rootfile1
ls -larth
```

## sticky bit
C'est une autorisation défini dans un répertoire qui autorise uniquement le propriétaire ou l'utilisateur de l'itinéraire à supprimer, renommer le contenu du répertoire défini avec le sticky bit.

- Définir un sticky bit

```bash
cd /opt/
sudo chmod 1770 /opt/perms # Avec cette autorisation les utilisateurs pourront écrire, créer des fichiers mais ne pourront pas supprimer le contenu de ce répertoire /perms
ls -larth
drwxrwxx--T # T = sticky bit
```

- Définir un setgid

```bash
cd /opt/
sudo chmod 2770 /opt/perms # Avec cette autorisation les utilisateurs pourront écrire, créer des fichiers mais ne pourront pas supprimer le contenu de ce répertoire /perms
ls -larth
drwxrwsx--- # s = setgid
```

- Définir un setgid + un sticky bit

```bash
cd /opt/
sudo chmod 3770 /opt/perms # Avec cette autorisation les utilisateurs pourront écrire, créer des fichiers mais ne pourront pas supprimer le contenu de ce répertoire /perms
ls -larth
drwxrwsx--T # s = setgid + T = sticky bit
```

- Permettre aux utilisateurs de changer leur mot de passe

```bash
ls -larth /etc/shadow
-rw-r----- # Nous pouvons écrire et lire
which passd
cd /usr/bin
ls -larth passwd
sudo chmod 755 passwd
passwd # Cela ne fonctionnera pas l'id pour restaurer une fonctionnalité est 4000
sudo chmod 4755 /usr/bin/passwd
passwd # Maintenant cela fonctionnera
```

- Trouver par exemple tous les dossiers qui ont un sticky bit

```bash
find / -type d -perm -2000
```

- Trouver par exemple tous les dossiers qui ont un sticky bit

```bash
find / -type d -perm -2000
```

1000 pour un sticky bit
4000 pour gérer un ensemble
