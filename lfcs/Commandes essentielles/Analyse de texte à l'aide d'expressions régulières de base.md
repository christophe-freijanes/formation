# Analyse de texte à l'aide d'expressions régulières de base
Les expressions régulières représentent un défi pour de nombreux administrateurs système Linux.
Ils peuvent être très puissants mais peuvent également être difficiles à construire correctement pour obtenir les résultats souhaités.
Nous allons examiner les expressions régulières de base et comment elles peuvent être utilisées pour analyser les fichiers texte à l'aide de la commande `grep`.
Vous ne vous sentirez peut-être pas comme un gourou des expressions régulières, mais vous aurez une compréhension de base du fonctionnement des expressions régulières et serez prêt à envisager de les maîtriser plus tard.

## Regex Basics

```bash
^ = Le début d'une chaîne ou d'une ligne
$ = La fin d'une chaîne ou d'une ligne
. = Caractère générique pouvant correspondre à n'importe quel caractère, sauf le saut de ligne (\n)
| = Correspond à un caractère ou un groupe de caractères spécifique de chaque côté
(par exemple a| b correspond à a ou b)
\ = Utilisé pour échapper à un caractère spécial
t = Le caractère ? T?
az = La chaîne de a-z
```

## Regex exemple
- Rechercher toutes lignes dans un fichier commencant par "The"

```bash
grep '^The ' fichier.txt
```

- Recherhcer toutes lignes commencant par la lettre T mais ne terminant pas par E

```bash
grep '^T[a-z][^e]' fichier.txt
```

- Rechercher toutes les instances d'un mot ici "The" ou "the"

```bash
grep '\<[tT]he\>' fichier.txt
```

- Rechercher toutes les adresses emails depuis un fichier

```bash
grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-a0-9.-]+\.[A-Za-z]{2,6}\b" fichier.txt
```
