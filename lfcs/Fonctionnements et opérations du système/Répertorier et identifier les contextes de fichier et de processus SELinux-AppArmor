#Fonctionnement et opérations du système
##Répertorier et identifier les contextes de fichier et de processus SELinux/AppArmor
Les systèmes Linux (en particulier dans un environnement de production) utilisent souvent des outils de sécurité pour empêcher les accès illicites, empêcher les services ou les applications d'utiliser des ressources excessives et prévenir les conflits de ressources accidentels.
Les distributions utilisent des stratégies similaires, bien que les outils et les processus puissent différer.
Nous examinerons les utilitaires qui nous permettront d'afficher les contextes de fichiers et de processus pour `SELinux` et `AppArmor`.
Vous serez en mesure de décrire et de trouver des contextes de fichiers et de processus pour `SELinux` et `AppArmor`.

#SELinux (Centos/RedHat)

- Connaitre tous les informations sur le context actuelle de SELinux
```bash
sudo semanage fcontext -l
```

- Rechercher un context particulier
```bash
sudo semanage fcontext -l | grep cron
```

- Lister les contexts avec les
```bash
ls -Z
```

- Voir les contexts des processus système
```bash
ps auxZ 
```

- Voir les contexts d'un processu
```bash
ps auxZ | grep cron
```

- Voir les contexts d'un processu plus détaillé
```bash
ps auxZ | grep -v grep | grep -e VSZ -e cron
```

- Commande qui permet de revenir au mode de SELinux par défaut
```bash
getenforce Enforcing
```
ou
```bash
getenforce Permissive
```

- Commande pour mettre à jour le mode SELinux par défaut
```bash
sudo setenforce permissive
getenforce Permissive
```

#AppArmor (Debian/Ubuntu)
AppArmor est similiaire à SELinux.

- Connaitre le status de AppArmor 
```bash
sudo aa-status
# Il faut analyser l'état des modes des profiles
```

- Le répertoire où sont stocker les modes
```bash
cd /etc/apparmor.d
ls -alh
```

- Lister les fichiers de configurations normalement il y en a 4
```bash
cd /etc/apparmor.d
ls -alh lxc
```

- Emplacement pour définir les règles dans un environnement de production
```bash
cd /etc/apparmor.d
cat lxc-containers
```

Les commandes pour la gestion des processus système sont les mêmes que sur un système Centos/RedHat.

- Définir un security mode en enforce mode
```bash
aa-enabled
```

- Désactiver le security profile
```bash
aa-disable
```

- Définir un security profile en complain mode
```bash
aa-complain
```
