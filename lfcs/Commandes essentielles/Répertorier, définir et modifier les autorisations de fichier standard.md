#Commandes essentielles
##Répertorier, définir et modifier les autorisations de fichier standard
Étant donné que tout sous Linux est un fichier, les autorisations de fichier sont très importantes.
Nous aborderons les autorisations de fichiers standard, comment elles affectent l'accès aux fichiers et comment les modifier pour répondre à nos besoins.
Nous utiliserons des utilitaires standard, tels que `chown` et `chmod`.
Vous serez en mesure de reconnaître les autorisations de fichiers et la configuration de propriété et de les mettre à jour pour protéger correctement vos fichiers et vous assurer que votre système Linux est sécurisé.

#Options de permission
```bash
d rwx r-x r-x 5 user group 4096 Nov 4 14:56 Documents
|  |   |  other   
|  |  group
|  |
| user/owner
|
- = file
d = directory
l = link
```

#Permission
```bash
r = read = 4 
w = write = 2 
x = execute = 1
```

#Permission Spécial
```bash
suid = S = 4000
sguid = s = 2000
sticky = t = 1000
```

#Modifier une permission

- Ceci permet d'avoir le full acces d'un fichier
```bash
sudo chmod 777 fichier
```

- Permettre a l'utilisateur de read write execute le fichier
```bash
sudo chmod u+rwx fichier
```

- Interdire au group et other d'executer le fichier
```bash
sudo chmod 766 fichier
ou
sudo chmod g-x fichier
sudo chmod o-x fichier
```

#Modifier le groupe ou l'utilisateur sudoers
- Changer l'utilisateur du fichier ou d'un Dossier par user=root
```bash
sudo chown root:linux Docusudo ments
```

- Changer le groupe d'un fichier ou d'un Dossier  par groupe=root
```bash
sudo chown linux:root Documents
```

#Stat
- Connaitre le détail d'un fichier
```bash
stat fichier.sh
```

#Rendre immuable un script

- Ajouter un attribue a un fichier
```bash
lsattr start.sh
----------------------e-----------start.sh
chattr +i start.sh
------i---------------e-----------start.sh
lsattr start.sh
```

- Supprimer un attribue a un fichier
```bash
lsattr start.sh
------i---------------e-----------start.sh
chattr -i start.sh
lsattr start.sh
----------------------e-----------start.sh
```

#Modifier un répertoire
- Utilisez la commande chown pour changer la propriété de l'utilisateur en cloud_useret le groupe devop pour le /opt/myapprépertoire et son contenu
```bash
find /opt/myapp -exec sudo chown cloud_user:devop {} \;
```

#Modifier les autorisation pour des fichiers appartenant à un Dossier
- Utilisez la commande chmod pour définir rw-rw----, ou 660, des autorisations sur tous les /opt/myappfichiers, à l'exception du répertoire lui-même et du /opt/myapp/start.sh script:
```bash
find /opt/myapp -name "d*" -ok chmod 660 {} \;
```

- Modifiez les autorisations sur tout ce qui ne commence pas par d (le répertoire lui-même et le start.sh script):
```bash
find /opt/myapp '!' -name "d*" -ok chmod 770 {} \;
```

#Trouver un répertoire sous /home qui n'appartient pas à un utilisateur ou à un groupe
- Utilisez la findcommande pour rechercher tous les répertoires dans les /homefichiers qui n'ont pas d'utilisateur et de propriétaire de groupe:
```bash
find /home -nouser -nogroup -ls
```

#Exécutez la commande chown avec la commande find
- Recherchez les fichiers et répertoires qui appartenaient à devuser
```bash
find /home -ls
```

- Recherchez tout ce qui n'a pas la propriété d'un utilisateur ou d'un groupe:
```bash
find /home -nouser -a -nogroup -ls
```

- Exécutez chown avec find pour modifier les fichiers qui n'ont aucun utilisateur ou groupe actuel:
```bash
sudo find /home -nouser -nogroup -exec sudo chown cloud_user:cloud_user {} \;
```

- Vérifiez que nous les avons tous:
```bash
find /home -nouser -a -nogroup -ls
```

- Voir si les cloud_user possède maintenant:
```bash
find /home/devuser -ls
```
