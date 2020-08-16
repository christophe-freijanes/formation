#Commandes essentielles
##Gérer l'accès au compte root
Sur une machine Linux, le `root` compte est tout-puissant et nous permet de faire à peu près tout ce que nous voulons.
Il est extrêmement important de limiter les personnes autorisées à accéder à ce compte.
Dans cette leçon, nous allons examiner sudoet suet voir comment nous pouvons les utiliser pour protéger un système.
À la fin de cette leçon, vous comprendrez la différence entre la connexion en tant que `root` et l'obtention de privilèges temporaires accrus.
Vous saurez également comment accorder à d'autres utilisateurs des privilèges élevés sans compromettre votre système.

#Ce connecter en root

- Pour connaitre l'utilisateur de la session
```bash
whoami
```

- Connaitre les droits et information sur l'actuelle utilisateur
```bash
id
```

- Pour visualiser les autorisations à l'utilisateur sudoers de son système
```bash
sudo cat /etc/sudoers
# User priviliege specification
root ALL=(ALL:ALL) ALL
```

- Elevation des droits d'un utilisateur
```bash
sudo visudo
# User priviliege specification
root ALL=(ALL:ALL) ALL
toto ALL=(ALL:ALL) ALL
```

- Permettre un utilisateur de faire partir du groupe sudoers
```bash
sudo gpasswd -a toto sudo
```

- Vérifier si un utilisateur est sudoers
```bash
id
```

- Enlever un utilisateur du groupe sudoers
```bash
sudo gpasswd -d toto sudo
```
