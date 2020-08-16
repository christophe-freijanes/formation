#Fonctionnement et opérations du système
##Diagnostiquer et gérer les processus
Savoir quels processus s'exécutent sur un système Linux et quels outils sont disponibles pour surveiller et gérer ces processus est un élément essentiel du rôle d'un administrateur système.
Nous allons voir `top`, `htop` et `ps`. Nous verrons quelles informations chaque commande fournit et comment tirer parti de ce que chacune offre.
Nous examinerons également la killcommande, ainsi que les commandes `nice` et `renice`.
Vous serez en mesure de récupérer des informations sur les processus de votre système pour vous aider à le gérer correctement.

#Manager et diagnostiquer ses processus
- Visualiser l'activités de ses processus en temps réel
```bash
top
```

- Visualiser graphiquement et avec plus de possibilitées
```bash
htop
```

#ps
- Faire un contrôle immédiat des processus en cours
```bash
ps -ef
```

- Faire un contrôle immédiat des processus en cours avec plus d'informations de performance
```bash
ps aux
```

- Rechercher l'activité d'un processus en particulier
```bash
ps aux | grep cron
```

- Rechercher l'activité d'un processus en particulier avec des filtres
```bash
ps aux | grep -v grep | grep -i -e cron
```

#nice
- Modifier la priorité d'un processus
```bash
sudo nice -n -10 /bin/bash
```

- Pour vérifier sa nouvelle valeur
```bash
htop
```

#renice
- Redéfinir la priorité de son processus par son pid  
```bash
sudo renice -20 12705
```
