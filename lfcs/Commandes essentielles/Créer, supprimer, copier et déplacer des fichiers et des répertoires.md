# Créer, supprimer, copier et déplacer des fichiers et des répertoires

Parfois, les choses ne sont pas exactement là où vous vous attendez. Nous allons examiner quelques commandes de base pour créer, supprimer, copier et déplacer des fichiers et des répertoires, afin que les choses soient là où vous en avez besoin.
Vous pourrez mélanger les fichiers comme un vrai joueur de carte !

- Plusieurs façon de créer un fichiers

```bash
touch fichier.txt
nano fichier.txt
ls -lhF > liste.txt
```

- Copier un fichier vers un dossier

```bash
cp fichier.txt mondossier/
```

- Copier un fichier vers un dossier en le renommant

```bash
cp fichier.txt /mondossier/fichier2.txt
```

- Déplacer un fichier vers un dossier

```bash
mv fichier.txt mondossier/
```

- Renommer un fichier

```bash
mv fichier.txt fichier2.txt
```

- Supprimer un fichier

```bash
rm fichier.txt
```

- Supprimer un dossier

```bash
rmdir mondossier/
```

- Supprimer tous les fichiers d'un dossier

```bash
rm -r mondossier/ 
```

- Supprimer en forçant, cette commande est dangereuse !

```bash
rm -rf mondossier/
```
