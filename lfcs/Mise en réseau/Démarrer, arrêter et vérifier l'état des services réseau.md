# Démarrer, arrêter et vérifier l'état des services réseau
Nous sommes déjà familiarisés avec l'utilisation de la commande `systemctl` pour gérer les services réguliers et réseau.
Nous allons jeter un œil à la commande `netstat`.
Nous utiliserons les informations qu'il fournit pour examiner divers services réseau afin de voir ce qui est en cours d'exécution, quels ports sont utilisés, si les connexions sont ouvertes et d'autres données générales sur le trafic.
Vous devriez être familiarisé avec la commande `netstat` et utiliser sa sortie pour gérer vos services réseau.

- Ce connecter en tant que root

```bash
sudo su
```

- Lister les sockets

```bash
netstat -a | more
```

- Savoir le nombre total de ports communiquant

```bash
netstat -a | wc -l
```

- Filtrer les sorties
T=tcp U=udp X=unix

```bash
netstat -at
# Ici on filtre uniquement les sorties tcp
```

- Filtrer les sorties uniquement en state = LISTEN

```bash
netstat -lt
```

- Filtrer les sorties udp cette commande renvoi toutes les informations

```bash
netstat -au
```

- Filtrer les sorties udp uniquement en écoute

```bash
netstat -lu
```

- Filtrer les sorties tcp uniquement en state = ESTABLISHED

```bash
netstat -t
```

- Filtrer les sorties tcp avec des informations sur le PID/prog

```bash
netstat -apt
```

- Filtrer les sorties tcp avec des informations sur le PID/prog uniquement en state = LISTEN

```bash
netstat -apt
```

- Analyser l'état des paquets

```bash
netstat -su
```

- Affiche la table de routage du kernel

```bash
netstat -r
```

- Informations des paquets sur chacune des interfaces

```bash
netstat -i
```

- Afficher le trafic en temps réel

```bash
netstat -ci
```
