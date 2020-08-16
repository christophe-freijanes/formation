# Gérer le processus et les services de démarrage (dans la configuration des services)
Un service Linux est une application ou un ensemble d'applications configuré pour se lancer au démarrage du système et s'exécuter en arrière-plan.
Sur les distributions Linux modernes, les services sont gérés par `systemctl`.
Nous allons passer en revue les bases de la commande `systemctl` et l'utiliser pour arrêter/démarrer et activer/désactiver les services.
Vous devriez vous sentir à l'aise avec la gestion des processus de démarrage sur un système Linux.

## systemctl

La gestion des services avec `systemd` est une compétence dont les administrateurs système Linux modernes ont besoin pour activer ou désactiver les processus à exécuter en tant que service sur le système.
Être capable de dépanner les services `systemd` est inestimable pour le bon fonctionnement du système.
Vous apprendrez à gérer les services `systemd` en résolvant les raisons de l'échec d'un service onehot systemd.
Vous devriez être à l'aise avec la gestion des `systemd` services `systemctl`.

- Vérifier le status d'un service

```bash
sudo systemctl status cron
```

- Les informations importantes lors du check du status

```bash
cron.service # nom du service
Loaded: loaded (/lib/systemd/system/cron.service; enabled; vendor preset: enabled) # Localisation + status = enabled
Active: active (running) since Mon 2019-12-20 14:45:32 UTC; 24h ago # Etat actuel, date et temps 
Main PID: 797 (cron) # PID
```

- Arrêter un service

```bash
sudo systemctl stop cron
```

- Démarrer un service

```bash
sudo systemctl start cron
```

- Désactiver un service

```bash
sudo systemctl disable cron
```

- Activer un service

```bash
sudo systemctl enable cron
```

### Exemple

- Utilisez `systemctl` pour vérifier l'état de target.service.
Mettez à jour le fichier d'unité de service systemd oneshot nommé target.service.
À l'aide de `systemctl` vérifier l'état du target.service.

```bash
systemctl status target.service
systemctl status -l target.service
```

À l'aide de l'éditeur de votre choix, mettez à jour le /etc/systemd/system/target.service fichier pour qu'il corresponde au contenu suivant.

```bash
[Unit] 
Description=Log when default target reached
After=cloud-final.service 

[Service] 
Type=oneshot        
RemainAfterExit=yes   
ExecStart=/bin/echo "--->  Reached default.target"
ExecStart=/bin/ls -l /etc/systemd/system/default.target 

[Install]  
# WantedBy is similar to runlevel
WantedBy=default.target 
```

- Rechargez le démon `systemd` pour que le fichier d'unité mis à jour soit disponible.
Vérifiez si le service va démarrer.
Utilisez la commande `systemctl` pour recharger le systemd démon, afin que le nouveau fichier d'unité puisse être géré.

```bash
systemctl daemon-reload
```

Utilisez la commande `systemctl` pour démarrer et vérifier l'état du `target.service`.

```bash
systemctl start target.service
systemctl status target.service
```

- Activez le `target.service` et redémarrez le système.
À l'aide de la commande `systemctl`, activez `target.service` et redémarrez le système pour vérifier le fonctionnement du service au moment du démarrage.

```bash
systemctl enable target.service
reboot
```

- Reconnectez-vous au système et vérifiez l'état du `target.service`.
Tout d'abord, vous devrez utiliser vos informations d'identification de laboratoire pour vous reconnecter au système et accéder au compte racine.
Ensuite, utilisez la commande `systemctl` pour afficher l'état du target.service.
Cela devrait montrer que le a `target.service` commencé correctement.

```bash
sudo -i
systemctl status target.service
```
