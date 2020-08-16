# Comparer et manipuler le contenu des fichiers et utiliser la redirection d'entrée-sortie

## Partie 1 - Créer des fichiers / entrée-sortie

L'une des tâches les plus courantes qu'un administrateur Linux est d'effectué l'examen des fichiers texte.
Nous allons examiner quelques commandes qui vous permettront d'afficher les données des fichiers et d'utiliser une redirection simple pour rendre la sortie plus gérable.
Vous devriez être en mesure d'utiliser des commandes comme `cat`, `more` et `less`, ainsi qu'un éditeur de texte comme `nano` pour afficher différents fichiers.

## cat

- Afficher le contenu d'un fichiers

```bash
cat fichier.txt
```

- Afficher le contenu d'un fichiers tout en utilisant les informations d'affichage de la commande more

```bash
cat fichier.csv | more
```

- Ou de more

```bash
cat fichier.csv | less
```

## more, less, sort

- Afficher le contenu d'un fichiers tout en permettant la navigation

```bash
more fichier.csv
```

- Si le fichier est important et pour lire tout son contenu depuis le terminal

```bash
less fichier.csv
less -N fichier.csv
```

- Pour consulter les informations du syslog

```bash
sudo less +F /var/log/syslog
```

- Pour afficher le contenu de son fichier dans un ordre alphabétique inversé (de bas en haut)

```bash
sort -r fichier.csv 
```

- Pour enregistrer le contenu d'un fichier dans l'ordre alphabétique dans un autre fichier

```bash
sort fichier.csv > sorted.txt
```

## touch

- Pour créer un fichier vierge

```bash
touch fichier.txt
```

## nano

- Editer avec nano notre nouveau fichier nano

```bash
nano nano.txt
```

- Pour couper du contenu
`ctrl + k`

- Pour mettre à la première ligne de notre liste
`ctrl + o`

En plus de visualiser le contenu des fichiers, un administrateur Linux doit être capable de revoir les fichiers et les répertoires pour identifier les changements ou les différences entre eux.
Nous allons jeter un oeil à la `diff`, `comm` et les `cmp` commandes, et comment les utiliser pour comparer les fichiers. À la fin de cette leçon, vous devriez être en mesure d'utiliser les commandes pour comparer des fichiers et des répertoires et identifier facilement les différences entre eux.

## diff

- Pour comparer ligne par ligne, 2 fichiers

```bash
diff fichier1 fichier2
```

Exemple:
- Indique le changement entre le fichier1 et fichier2

```bash
26c26 26=fichier1 c=changement 26=fichier2
< Test1
---
> Test12
```

- Rajout d'un ligne sur le fichier2

```bash
87a88 87=fichier1 a=add 88=fichier2
> Test12
```

- Suppression sur le fichier1 de Test1

```bash
126c126 126=fichier1 d=delete 126=fichier2
< Test1
```

- Permet de comparer visuellement les changements fait de nos deux fichiers

```bash
diff -c fichier1 fichier2
```

La suite ********* represente le fichier1
Les *** 23,29 **** indique les lignes contenant des modifications sur notre fichier1
Les -------- represente notre fichier2
! = changement // + = add // - = delete

- Comparer des dossiers avec la commande diff

```bash
diff ../shop/ ../data/shop/
```

## comm

- Permet de voir les comparaisons entre deux fichiers différents

```bash
comm fichier1 fichier23
```

## cmp

- A voir un résumer des différences entre nos deux fichiers

```bash
cmp fichier1 fichier2
```

Si la commande ne retourne rien c'est que les deux fichiers sont identique
