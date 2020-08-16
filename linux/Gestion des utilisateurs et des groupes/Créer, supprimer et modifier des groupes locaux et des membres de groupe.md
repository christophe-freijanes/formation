# Créer, supprimer et modifier des groupes locaux et des membres de groupe
La gestion de groupe est une autre activité courante mais critique que vous effectuerez en tant qu'administrateur système.
Les groupes peuvent être importants car ils peuvent être utilisés pour accorder des privilèges à des outils tels que sudo et être poursuivis pour accorder ou restreindre des autorisations sur des fichiers et des répertoires.
Nous allons jeter un coup d' oeil aux commandes `addgroup`, `groupadd`, `usermod`, `delgroup` et `groupdel` pour vous aider à gérer et à maintenir des groupes.

## Gestion des utilisateurs et des groupes

- Lister/vérifier les groupes existants

```bash
cat /etc/group
```

- Ajouter un groupe, commande disponible pour toutes les distributions

```bash
sudo groupadd group1
```

- Créer un groupe dans la plage réservée

```bash
sudo groupadd -r group1
```

- Ajouter un groupe, commande non disponible pour toutes les distributions

```bash
sudo addgroup group1
```
- Vérifier l'appartenance d'un utilisateur à un groupe

```bash
groups username
```

- La commande `id` peut aussi vous aider

```bash
id username
```

- Ajouter un utilisateur à un groupe existant
a = append (ajouter)
G = group

```bash
sudo usermod -aG group1 username
cat /etc/group
```

- Ajouter un utilisateur à second groupe existant

```bash
sudo gpasswd -a username group2
cat /etc/group
```

- Supprimer un utilisateur du group2

```bash
sudo gpasswd -d username group2
cat /etc/group
```

On peut aussi éditer avec un éditeur le fichier /etc/group est supprimer l'utilisateur d'un groupe.

```bash
sudo nano /etc/group
#Supprimer le ou les utilisateurs de votre groupe
cat /etc/group
```

- Ajouter un mot de passe à son groupe

```bash
sudo gpasswd group1
# On ajoute un utilisateur au group1
sudo usermod -aG group1 username
newgrp group1
ls -alh
# Pour tester on créer un fichier texte
touch fichier.txt
ls -alh
# On voit qu'il fait parti du group1
```

- Supprimer un groupe

```bash
sudo groupdel group1
cat /etc/group
```

- Seconde méthode de suppression d'un groupe

```bash
sudo delgroup group2
cat /etc/group
```

- Troisième méthode de suppression d'un groupe
```bash
sudo nano /etc/group.edit
# Supprimer la ligne contenant le groupe à supprimer
# Enregistrer et vérifier
cat /etc/group
```

- Définissez un mot de passe temporaire (que l'utilisateur devra modifier la première fois qu'il se connectera):

```bash
echo Temp@$$ | passwd --stdin usernanme
```

- Verrouillez et déverrouillez le compte à l'aide de la commande usermod

```bash
usermod -L test1
tail -n1 /etc/passwd /etc/shadow
usermod -U test1
```

- Changer leur mot de passe à la prochaine connexion

```bash
chage -d0 test1
```

- Vérifier un compte

```bash
id test1
```

- Donnez à un groupe des autorisations d'écriture et révoquez toutes les autorisations de toute autre personne

```bash
chmod g+ws,o-rx /usr/local/test_scripts
```

- Commande de vérification après création, modification

```bash
su - test1
cd /usr/local/test_scripts
mkdir dir1
touch file1
ls -l
```
