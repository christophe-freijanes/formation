# Archiver, sauvegarder, compresser, décompresser et décompresser des fichiers

Savoir comment sauvegarder un système Linux est crucial pour un administrateur système Linux.
Nous allons examiner quelques techniques courantes de sauvegarde et de restauration, en tirant parti de la commande Tape ARchive - `tar`.
Vous comprendrez l'historique de la commande `tar` et serez en mesure de créer des archives de vos fichiers importants sur n'importe quel support moderne, pas seulement sur les disquettes à l'ancienne.

- Création d'une archive tar du contenu de /home/user/toarchive/ pour des fichiers vers notre dossier de /backup/

```bash
cd /backup/
sudo tar cvf mybackup.tar /home/user/toarchive/
```

- Vérifiction de notre backup depuis notre dossier /backup

```bash
ls -lhF
```

- Création d'une archive zippé du contenu de /home/user/toarchive/ pour des fichiers vers notre dossier de /backup/

```bash
cd /backup/
sudo tar cvfz mybackup.tar.gz /home/user/toarchive/
```

- Visualiser le contenu d'un fichier tar

```bash
tar tf mybackup.tar
tar tf mybackup.tar.gz
```

- Lister dans fichier texte les fichiers contenu dans l'archive

```bash
tar -tvf myapp.tar.gz > app.list
```

- Pour extraire le contenu de notre fichier tar

```bash
tar xvfz mybackup.tar.gz
```

- Pour extraire le contenu de notre fichier tar vers un répertoire

```bash
tar xvfz mybackup.tar.gz --directory=torestore/
```
