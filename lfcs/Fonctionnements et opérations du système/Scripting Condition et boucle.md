# Scripting Condition et boucle
La possibilité d'utiliser des évaluations conditionnelles dans un script augmentera votre script-fu et rendra vos scripts plus puissants et plus flexibles.
Nous examinerons les opérateurs et utiliserons l' instruction if pour évaluer une condition, puis exécuterons une commande basée sur les résultats.
Vous devriez avoir une idée de comment utiliser les opérateurs pour configurer des évaluations conditionnelles et comment utiliser if pour exécuter des commandes basées sur les résultats conditionnels.

## Operation
- Lister son repertoire de scripts

```bash
ls -alh
```

- Lire un script depuis son terminal

```bash
cat script.sh | less
```

- Exécuter un script depuis son terminal

```bash
./script.sh
```
### if

- Cas pratique

exemple.sh

```bash
#!/bin/bash

FIRST=10
SECOND=20

if [ $((FIRST) -eq $(SECOND)) ]; then
    echo Is $((FIRST)) is equal to $((SECOND))?
    echo Yes, $((FIRST)) is equal to $((SECOND))
else
    echo Is $((FIRST)) is equal to $((SECOND))?
    echo No, $((FIRST)) is NOT equal to $((SECOND))
fi
```

## For/While/Until
### for
- Création d'un script qui va checker les urls inscrite dans une liste avec for

```bash
#!/bin/bash
for url in $(cat listofurls.txt)
do
    curl "$url" >> webpage_combined_for.html
done
```

### while
- Création d'un script qui va checker les urls inscrite dans une liste avec while

```bash
#!/bin/bash
while read url
do
    curl "$url" >> everypage_combined_while.html
done < listofurls.txt
```

### until
- Création d'un script qui permettra d'augmenter la taille de 1KB

#!/bin/bash
FILENAME=`basename "$0"`
echo $FILENAME
TMP_FILE="./tmp1"
TARGET_FILE="./target"
cat $FILENAME > $TARGET_FILE
FILESIZE=0

## Augmenter la taille des fichiers jusqu'à (until) 1KB
until [ $FILESIZE -gt 1024 ]
do
    # Ajouter ce fichier au contenu du fichier cible (target)
    cp $TARGET_FILE $TMP_FILE
    cat $TMP_FILE >> $TARGET_FILE

    FILESIZE=`du $TARGET_FILE | awk '{ print $1 }'`
    echo "Filesize: $FILESIZE"

    sleep1
done

echo "Nouvelle taille de fichier atteinte de 1KB"
```
