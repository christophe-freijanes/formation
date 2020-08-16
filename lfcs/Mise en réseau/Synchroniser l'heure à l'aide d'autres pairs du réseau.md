#Mise en réseau
##Synchroniser l'heure à l'aide d'autres pairs du réseau
De nombreux services et applications Linux dépendent de l'heure système précise sur plusieurs nœuds, c'est donc à l'administrateur système Linux de s'assurer que les informations d'heure et de date sont exactes pour maintenir la fiabilité.
Nous verrons comment garder les serveurs synchronisés avec les serveurs de temps externes à l'aide de la commande `timedatectl`.
Vous devriez être familiarisé avec la commande et être en mesure de vérifier et d'ajuster vos paramètres d'heure si nécessaire.

- Afficher l'heure de votre machine
```bash
timedatectl
```

- Lister les timezones de disponible
```bash
timedatectl list-timezones | grep Paris
```

- Définir une nouvelle timezones à sa machine
```bash
sudo timedatectl set-timezone Europe/Paris
```

- Désactiver le service et passer en mode NTP
```bash
sudo timedatectl set-ntp no
# Il n'est pas recommandé de le désactiver 
```

- Régler l'heure manuellement de son système
```bash
sudo timedatectl set-time 22:00:00
```

- Réactiver la synchronisation de temps
```bash
sudo timedatectl set-ntp yes 
```

#Synchronisation de l'heure avec NTP
Notre équipe d'administration système a décidé qu'il était temps de mettre en œuvre le protocole NTP (Network Time Protocol).
Cela facilitera l'analyse des fichiers journaux et résoudra les problèmes liés à l'échec de l'authentification sensible au temps.
Nous devons installer le ntp package pour fournir un serveur NTP.
Ensuite, nous mettrons /etc/ntp.conf à jour le fichier pour utiliser 169.254.169.123 en tant que serveur et 10.5.0.20 en tant que pair.
Nous devrons nous assurer de définir l'entrée de restriction appropriée dans le /etc/ntp.conf fichier pour le pair 10.5.0.20 et de supprimer toutes les entrées de serveur supplémentaires.
Après avoir configuré le ntpd.service, nous pouvons activer et démarrer le service.
Enfin, nous allons utiliser ntpq pour interroger la synchronisation des pairs et vérifier que NTP fonctionne correctement.

- Installez le progiciel ntp
Démarrez un shell racine interactif avec sudo -i.
À l'aide de la commande yum, installez le ntp progiciel.
```bash
sudo -i
yum -y install ntp
```

- Configurez le ntpd.service en mettant à jour /etc/ntp.conf
Utilisez un éditeur pour ajouter les lignes suivantes à /etc/ntp.conf:
```bash
restrict 10.0.5.20
peer 10.0.5.20
server 169.254.169.123 iburst
# Supprimez ou mettez en commentaire toutes les autres lignes commençant par «serveur».
```

- Activez et démarrez le ntpd.service
En utilisant systemctl, activez et démarrez ntpd.service immédiatement:
```bash
systemctl enable ntpd.service --now
```

Vérifiez que NTP fonctionne correctement
Vérifiez l'état du ntpd.servicepour vous assurer qu'il est en cours d'exécution. À l'aide de la ntpqcommande, visualisez l'état actuel de la synchronisation:
```bash
systemctl status ntpd.service
ntpq -c peers
```
