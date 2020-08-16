# Vérifier l'intégrité et la disponibilité des processus clés
Les processus sont des applications qui sont activement chargées et/ou exécutées dans un système d'exploitation.
Ces processus consomment de la mémoire et des cycles CPU, et peuvent parfois rencontrer des problèmes.
Nous utiliserons des outils tels que `ps`, `top` et `htop` pour examiner de plus près les processus sur nos systèmes.
Vous pourrez utiliser les outils pour en savoir plus sur les processus de vos systèmes.

## ps
La commande ps permet de faire un snapshot d'un processus.
- Connaitre les informations de tous les processus en cours d'exécution

```bash
ps -e
```

- Connaitre plus d'informations sur nos processus en cours

```bash
ps -ef
```

- Connaitre plus d'informations de consommation de mémoire, cpu des processus en cours

```bash
ps aux
```

- Connaitre les informations des processus parent (arboresence parent et ses enfants)

```bash
ps aux --forest
```

- Exemple pour connaitre la relation parent - enfants d'un processus

```bash
ps aux --forest | grep sshd 
```

```bash
ps aux --forest | grep cron
# Ici cron n'a pas d'enfants
```

```bash
ps aux | grep -v grep | grep cron
# Nous avons uniquement les informations du processus cron
```

```bash
ps aux | grep -v grep | grep -e VSZ -e cron
# Nous avons toutes les informations possible du processus cron
```

## top/htop
La différence entre top et htop est que htop est intéractif, on peut utiliser des touches et sa souris.
