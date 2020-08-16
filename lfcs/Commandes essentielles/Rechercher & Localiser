# Commandes essentielles

## Recherche de fichiers & localiser find & locate
Savoir où se trouvent les fichiers dans un système Linux peut être écrasant. 
Nous allons explorer l'utilisation des commandes findet locatepour identifier l'emplacement des fichiers en fonction de paramètres tels que le nom et la propriété du fichier.
Vous pourrez utiliser ces commandes pour rechercher des fichiers sur votre système Linux.

# find
- Chercher un fichier à partir de son nom
```bash
find -name "search.txt"
```

- Chercher un fichier à partir de son nom depuis son path
```bash
find / -name "search.txt"
```

- Chercher un fichier à partir de son nom depuis son path avec les permissions sudoers
```bash
sudo find / -name "search.txt"
```

- Chercher un fichier à partir de son nom depuis son dossier avec les permissions sudoers
```bash
sudo find /etc -name "search.txt"
```

- Chercher un fichier à partir de son nom depuis son dossier avec les permissions sudoers et enlever la sensibilitée à la casse.
```bash
sudo find /etc -iname "search.txt"
```

- Chercher tous les fichiers *.log depuis la racine avec les permissions sudoers et en précisant le type de recherche 
f = files
```bash
sudo find / -type f -name "*.log"
```

- Chercher tous les fichiers d'un utilisateur 
```bash
sudo find /etc -type f -user christophe
```

- Chercher des informations sur un fichier. Exemple l'utilisateur et le groupe dont fait partie cette utilisateur concernant un fichier
```bash
ls -l /etc/search.txt
```

# locate
- Locate sert à rechercher des informations concernant une db.
```bash
locate "search.txt"
```

- La bonne pratique pour localiser un fichier depuis une db
```bash
sudo updatedb
locate "search.txt"
```

- Rendre la recherche non sensible à la casse d'un fichier 
```bash
locate -i "search.txt"
```

## Recherche de fichiers qui? où? type?
Nous allons élargir nos connaissances de recherche en utilisant les which, whereiset les typecommandes pour localiser les applications et les informations d'application.
Vous pourrez utiliser ces commandes pour savoir où se trouve une application, quelle version d'une application est utilisée dans une session et quelles versions supplémentaires sont disponibles.

# which (qui?)
- Trouver qui exécute un programme
```bash
which python
```

- Localiser les repertoires qui s'exécute sur le système
```bash
echo $PATH
```

# whereis (où)
- Trouver où ce situe les dépendences d'un programme
```bash
whereis python
```

- Lister les dépendences d'un programme
```bash
whereis python | tr " " '\n'
```

# type (type)
- Afficher le type de dépendences dont dépends un programme
```bash
type python
```

- Afficher les informations d'une commande
```bash
type ls
```

- Afficher toutes les informations d'une commande
```bash
type -a ls
```
