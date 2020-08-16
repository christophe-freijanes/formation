#Fonctionnement et opérations du système
##Utiliser les scripts pour automatiser les tâches de maintenance du système

- Cas pratique
exemple.sh
```bash
#!/bin/bash
echo
echo "Test"
echo
# Afficher le nom de l'utilisateur
echo "User: "`whoami`
# Afficher le répertoire courant
echo "Current Directory: " $(pwd)
#echo -n "Current shell:"
lsb_release -d
echo
```
- Privilèges d'exécution
Avant tester votre script regarder si vous avec les droits d'exécution (rwx)
```bash
ls -al
```

si ok

```bash
./exemple.sh
```

- Tips
Permettre l'exécution de nos scripts depuis notre répertoire ~/scripts

```bash
# Analyse des dossiers qui peuvent exécuter sur notre système
echo $PATH
# Permettre à notre repertoire ~/scripts d'exécuter nos scripts comme commande
export PATH=$PATH:/home/user/scripts
# Analyse des dossiers qui peuvent exécuter sur notre système notre dossiers scripts doit être visible
echo $PATH
```
