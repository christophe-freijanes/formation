# Utiliser la redirection entrée-sortie (par exemple>, >>, |, 2>)
Les administrateurs système Linux doivent souvent enchaîner les commandes, et Bash permet de manipuler le contenu des fichiers à l'aide de redirecteurs d'entrée-sortie.
Nous parlerons de stdin, stdout et stderr ainsi que des utilisations les plus courantes de la redirection d'E/S, telles que le caractère de canal (`|`) et les caractères vers et depuis ( `<` et `>` ).
Nous verrons également comment rediriger une sortie spécifique, telle que stderr, vers un emplacement différent de stdout.
Vous vous sentirez en confiance en dirigeant la sortie d'une commande vers l'entrée d'une autre.

```bash
stdin = Entrée des données
stdout = Retour des données depuis des commandes exécuté
stderr = Message d'erreur
```

## | commande pipe
- Permettre le scrolling dans une liste

```bash
ls -l /etc | less
```

- Permettre une recherche dans une liste des 10 première ligne dans un ordre alphabétique

```bash
cat fichier.csv | sort | head -10
```

## > écriture vers un fichier
- Ecrire vers un fichier

```bash
ls -l /etc > etclist.txt
```

- Pour changer tout le contenu de notre fichier etclist.txt

```bash
ls -l / > etclist.txt
```

## >> Rajouter des informations dans la même liste
- Construction d'un fichier list.txt avec plusieurs écritures de liste de repertoires différents

```bash
ls -l / >> list.txt
ls -l /home/user/ >> list.txt
```

Cette commande va créer un fichier list.txt qui aura pour contenu une liste de nos différents répertoires.

## < input

- Souvent utiliser dans les scripts par exemple pour indiquer un message d'erreur
Pour lire directement le contenu d'un fichier

```bash
less < fichier.csv
```

- Exemple redirection d'un message d'erreur vers un fichier

```bash
cat varlist
cat varlist 2>error.txt
```

Depuis dev/null nous pourrons voir les messages d'erreur spécifique

```bash
cat varlist 2> /dev/null
ls /dev/null
```
