#Gestion des utilisateurs et des groupes
##Gérer l'environnement utilisateur du modèle
Nous allons jeter un œil au `/etc/skel` répertoire et à son importance pour vous.
Lorsque nous aurons terminé, vous serez en mesure d'adapter votre `/etc/skel` répertoire pour répondre à vos besoins en tant qu'administrateur système Linux.

#/etc/skel
Si nous créeons un nouvel utilisateur avec la commande `adduser` une fois le home directory créée il va le copier dans `/etc/skel`

- Lister les fichiers présents dans /etc/skel
```bash
ls -alh /etc/skel/
```

- Lister les fichiers d'un home directory
```bash
ls -alh /home/username
```

- Création de dossier depuis /etc/skel/
```bash
cd /etc/skel
mkdir Documents
mkdir backup
```

- Edition d'un fichier de bienvenue pour les nouveaux utilisateurs
```bash
cd /etc/skel
sudo nano WELCOME
# Bienvenue dans la team ;)
```

- Edition du script de création de profil .profile
```bash
cd /etc/skel
sudo nano .profile
# Rajouter la ligne suivante en bas du script
alias li="ls -ali"
```

Si l'on créer un nouvel utilisateur avec la commande adduser on s'aperçoit en listant le home directory...
Qu'il y a notre fichier WELCOME, nos dossiers Documents/ et backup/ :)

- Ce connecter avec un autre utilisateur
```bash
su - username
```





