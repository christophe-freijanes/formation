#Mise en réseau
##Configurer les services réseau pour démarrer automatiquement au démarrage
Les systèmes Linux remplissent de nombreux rôles et sont utilisés par de nombreuses applications et systèmes sur le réseau.
Nous examinerons la configuration des services réseau pour démarrer automatiquement au démarrage.
La gestion des services réseau n'est pas très différente de la gestion d'autres services.
Vous devriez être en mesure de gérer les services réseau comme si c'était n'importe quel autre service.

#Configuration service
- Vérifier le status du service telnet (client) et telnetd (serveur)
```bash
sudo systemctl status inetd
sudo systemctl status xinetd
```

- Installer le service telnet
```bash
sudo apt install telnet telnetd
sudo apt install xinetd
```

- Vérifier l'installation d'un service
```bash
/etc/services | grep -e xinetd telnet
# On voit les ports utilisés par nos services xinetd et telnet
```

- Tester la connexion de telnet
```bash
telnet localhost
# Utiliser votre compte utilisateur
```

- Vérifier les connexions active de votre session
```bash
w
# On voit que notre session telnet est toujours active penser à faire
exit
w
# Maintenant la session telnet est fermée
```

- Recommandation
Dans les bonnes pratiques il est recommandé de désactiver le service xinetd
```bash
sudo systemctl stop xinetd
```
