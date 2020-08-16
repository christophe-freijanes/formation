#Fonctionnement et opérations du système
##Mettre à jour et gérer les logiciels pour fournir les fonctionnalités et la sécurité requises

#Ubuntu/Debian
La capacité de gérer les logiciels et les mises à jour sur un système Linux est l'une des compétences les plus importantes d'un administrateur système Linux.
Nous passerons en revue les `dpkg`, `aptitude` et `apt`/`apt-get` outils qui sont couramment utilisés dans les systèmes basés sur Debian comme Ubuntu.
Vous devriez comprendre ce que chaque outil offre et vous sentir à l'aise pour mettre à jour, installer, désinstaller et récupérer des informations sur les paquets sur Ubuntu et d'autres systèmes Debian.


#dpkg - Low level
- Permettre l'installation d'un logiciel
```bash
dpkg -i programme.deb
```

- Lister les programmes installés
```bash
dpkg -l
```

- Connaitre les détails d'un paquet
```bash
dpkg -l zip
```

- Connaitre la version et l'emplacement d'un paquet
```bash
dpkg -S znew
```

- Désinstallattion d'un paquet
```bash
dpkg -r pkgname
```

- Afficher les informations sur le package tzdata et reconfigurer ce package
Utilisez la dpkgcommande pour afficher les informations sur le tzdata.
Utilisez dpkg-reconfigure pour régler le fuseau horaire sur US/Pacifique.
```bash
dpkg -s tzdata
dpkg-reconfigure tzdata
```
Une fois la commande reconfigure tzdata exécutée, la fenêtre de configuration du package nous sera proposée et nous pourrons définir le fuseau horaire correct.

#aptitude
- Ouvrir l'interface graphique
```bash
sudo aptitude
```

#apt/apt-get - High level
- Installer un paquet
```bash
apt install tmux
```

- Désinstaller un paquet
```bash
apt remove tmux
```

- Nettoyer le cache
```bash
apt clean
```

- Mise à jour de ses paquets
```bash
apt update
```

- Connaitre les paquets upgradeable
```bash
apt list --upgradeable
```

- Avoir des informations sur un paquet ou rechercher un paquet non installé
```bash
apt search htop
```

- Utilisez la commande `apt` pour nettoyer, mettre à jour et mettre à niveau le logiciel système
Nettoyer les informations mises en cache `apt`, récupérer les dernières informations sur les packages disponibles et mettre à niveau le logiciel système
```bash
sudo -i
apt clean
apt update
apt list --upgradeable
apt upgrade
```

- Recherchez le package apache http, installez-le avec le package elinks et utilisez elinks pour vider la page d'accueil dans /root/index.html
Utilisez la commande `apt` pour trouver le apache httppackage.
Installez-le, puis installez-le elinkspour vérifier le fonctionnement du serveur.
Utilisez elinkspour afficher la http://localhostpage d'accueil vers/root/index.html
```bash
apt search 'apache http'
apt install apache2 elinks
```

Pour simplement voir si le serveur est en marche, exécutez cette commande:

```bash
elinks http://localhost
```
Nous devrions voir un Ça marche! page.
Appuyez sur la touche q pour revenir à une ligne de commande.
Maintenant, vidons la sortie de cette page dans un fichier texte:
```bash
elinks -dump http://localhost > index.html
```

#CentOS / Redhat
La capacité de gérer les logiciels et les mises à jour sur un système Linux est l'une des compétences les plus importantes d'un administrateur système Linux.
Nous allons passer en revue les `rpm`, `yum` et les outils `dnf` qui sont couramment utilisés dans les systèmes à base de RedHat comme CentOS et Fedora.
Vous devez comprendre ce que chaque outil offre et vous sentir à l'aise pour mettre à jour, installer, désinstaller et récupérer des informations sur les packages sur CentOS et d'autres systèmes RedHat.

#rpm - Low level
- Connaitre le nombre de paquets présent sur son système
```bash
rpm -qa | wc
```

- Connaitre les paquets installés d'une application
```bash
rpm -qa 'httpd*'
```

- Lister les paquets recemments installés
```bash
rpm -qa --last | tac
```

- Informations détaillées d'un paquet
```bash
rpm -qi httpd
```

-Connaitre les fichiers de documentations
```bash
rpm -qd httpd
```

-Connaitre les fichiers de configuration
```bash
rpm -qc httpd
```

- Installer un paquet
```bash
rpm -ivh filename.rpm
``` 

- Upgrade d'un paquet
```bash
rpm -Uvh filename.rpm
```

- Supprimer un paquet à installer
```bash
rpm -e tmux
```

- Lister les paquets installés
```bash
rpm -qaGestion des utilisateurs et des groupes
```

- Avoir des informations sur un paquet ou rechercher un paquet non installé
```bash
rpm -qi tmux
```

- Best practice pour installer un paquet en low level
```bash
rpm -qp /tmp/elinks-0.1.2
rpm -qp --scripts /tmp/elinks-0.1.2
rpm -ivh /tmp/elinks-0.1.2
# Si une dépendances est Failed
yum localinstall /tmp/elinks-0.1.2
```

#yum - High level
- Lister les paquets installés
```bash
yum list installed
```
- Lister les paquets installés ayant ssh dans leur nom
```bash
yum list installed | grep ssh
```

- Rechercher un paquet à installer
```bash
yum search tmux
```

- Test un paquet et connaitre la version qui va être installer
```bash
yum provides httpd
```

- Installer un paquet
On peut checker la version du paquet qui va être installer ainsi que ses dépendances
```bash
sudo yum install tmux
```

- Supprimer un paquet à installer
```bash
sudo yum remove tmux
```

- Nettoyer les métadonnées et création du cache YUM
```bash
sudo yum clean all
sudo yum makecache
```

- Pour vérifier les mise à jour disponible de nos paquets
```bash
yum check-update
```

- Mettre à jour un paquet uniquement
```bash
sudo yum update python-perf.x86_64
```

- Mettre le système à jour
```bash
sudo yum -y update
```

- Avoir les informations détaillées de son paquet
```bash
sudo yum info httpd
```

#dnf
Les outils dnf utilise les mêmes fonctionnalités que yum.
Si les outils dnf sont installés et si nous voulons installer un paquet, il pourrat nous le proposer.

- Installer un paquet avec les outils dnf
```bash
tmux
```
Si nous tapons simplement le nom et qu'il existe, il va nous proposer de l'installer par ? [N/y]
Mais vu que nous n'avons pas les privilèges sudoers  il va nous indiquer "Failed to install packages:"
```bash
sudo dnf install tmux
```

- Supprimer un paquet
```bash
sudo dnf remove tmux
```
