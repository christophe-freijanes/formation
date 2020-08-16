#Commandes essentielles
##Créer et gérer des liens matériels et logiciels
Avec les systèmes de fichiers Linux, il peut y avoir plusieurs pointeurs -> la même zone sur le disque ou des raccourcis
qui se comportent comme des cibles à la fois localement et sur d'autres systèmes de fichiers ou disques. 
Nous examinerons les liens matériels et immatériels et explorerons leurs similitudes et leurs différences. 
Vous serez en mesure de comprendre la différence entre les liens symboliques hard & soft et vous pourrez exploiter ces différences
pour gérer et protéger efficacement vos fichiers!

#Hard Link
- Création d'un lien symbolique dur "hard link" d'un fichier
```bash
ln info.txt infohardlink
```

- Visualiser les inodes des fichiers de votre dossier
```bash
ls -li 
```

- Editer un fichier ln
```bash
nano infohardlink
```

- Vérifier que les changements on bien été transmis à notre fichier d'origine "info.txt"
```bash
cat info.txt
```
Si je supprime le fichier info.txt le fichier infohardlink n'est pas supprimé, il a toujours ses informations.

#Soft link
- Création d'un lien symbolique "soft link" d'un fichier
```bash
ln -s details.txt detailsoftlink
```
detailsoftlink sera redirigé -> details.txt

- Création d'un lien symbolique "soft link" d'un fichier
```bash
ln -s data/details.txt newsoftlink
```
newsoftlink sera redirigé -> data/details.txt

- Création d'un nouveau dossier et d'un lien symbolique vers un dossier existant
```bash
ln -s data mysoftlink
```
