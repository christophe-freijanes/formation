#Fonctionnement et opérations du système
##Localiser et analyser les fichiers journaux du système
Si votre système ne fonctionne pas correctement, où devriez-vous chercher pour trouver des informations sur le problème afin de le résoudre?
Nous allons voir où trouver les fichiers journaux système sur les systèmes Centos/Redhat et Debian/Ubuntu.
Ensuite, nous examinerons quelques journaux principaux sur chaque système.
Nous utiliserons quelques trucs et astuces qui faciliteront également la visualisation des informations.
Vous pourrez localiser les journaux système et avoir une bonne idée de la façon de trouver des informations spécifiques dans ceux-ci.

#Debian/Ubuntu
syslog = Informations du systèmes
auth.log = Informations de l'authentification

- Rechercher tous les fichiers log de son système Debian/Ubuntu
```bash
ls /var/log
```

- Rechercher les informations systèmes avec less
```bash
sudo less /var/log/syslog
```
- Faire une recherche dans syslog avec less et grep
```bash
sudo less -F /var/log/syslog | grep apparmor
```

- Rechercher les informations systèmes sur les mises à jours système, installation, désinstallation de paquets
```bash
sudo less /var/log/dpkg.log
```

#Centos/Redhat
messages = Informations du systèmes
secure = Informations de l'authentification

- Rechercher tous les fichiers log de son système Centos/Redhat
```bash
ls /var/log
```

- Rechercher les informations systèmes avec less
```bash
sudo less /var/log/messages
```

- Faire une recherche dans syslog avec less et grep
```bash
sudo less -F /var/log/syslog | grep acpi
```

- Rechercher les informations systèmes sur les mises à jours système, installation, désinstallation de paquets
```bash
sudo less /var/log/yum.log
```



