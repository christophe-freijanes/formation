# Créer, supprimer et modifier des comptes d'utilisateurs locaux
La gestion des utilisateurs est l'une des activités les plus courantes, mais essentielles, que vous effectuerez en tant qu'administrateur système.
Nous allons jeter un oeil à des commandes comme `adduser`, `useradd`, `usermod`, `deluser` et `userdel`, qui vous aidera à gérer et maintenir vos utilisateurs.
Vous saurez quelles sont vos options pour créer et gérer des comptes d'utilisateurs.

## Rajouter un utilisateur
- Commande de rajout d'un utilisateur avec n'importe quel distributions

```bash
sudo useradd username
#adduser est possible aussi mais elle n'est pas disponible sur toutes les distributions.
#Elle permet de créer directement un home directory et de saisir un mot de passe.
```

- Vérifier la création d'un utilisateur

```bash
cat /etc/passwd
```

- Vérifier l'id de l'utilisateur

```bash
id username
```

## Modifier un utilisateur

- Vérifier si un home directory a été créer

```bash
cd /home
ls -alh
```

- Création d'un utilisateur avec son home directory

```bash
sudo useradd -m -s /bin/bash username 
```

- Définir un mot de passe à un utilisateur

```bash
sudo passwd username 
```

- Rajouter un commentaire à un compte

```bash
sudo usermod -c "ceci est un test" username
cat /etc/passwd
```

- Ajouter un groupe à un utilisateur

```bash
sudo usermod -aG lxd username
id username
cat /etc/passwd
```

## Supprimer un utilisateur
- Suppression d'un utilisateur de son système

```bash
sudo userdel username
cat /etc/passwd
```

- Vérifier si l'utilisateur avait un home directory de créée

```bash
cd /home
ls -alh
```

- Suppression d'un home directory

```bash
cd /home
ls -alh
sudo chown -R admin_user:admin_user username
rm -rf /home/username/
```

- Suppression d'un utilisateur avec la commande `deluser`

```bash
cd /home
ls -alh
# Sauvegarde du home directory dans le /home puis suppression
sudo deluser --backup --backup-to /home --remove-home username
# Vérification que l'utilisateur est bien supprimer
cat /etc/passwd
# Vérification que la sauvegarde c'est bien faite
ls -alh
```
