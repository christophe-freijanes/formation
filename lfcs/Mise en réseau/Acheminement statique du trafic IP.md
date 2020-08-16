# Acheminement statique du trafic IP
Un réseau est une autoroute, conçue pour acheminer des paquets d'informations vers leur destination.
Parfois, un administrateur Linux doit fermer une route en raison de problèmes ou de travaux.
Nous examinerons les commandes `route` et `ip route`, pour vérifier nos routes actuelles et ajouter ou supprimer des routes si nécessaire.
Vous devriez être à l'aise pour afficher les tables de routage, comprendre les bases de la commande `ip route` et savoir comment utiliser la page de manuel pour en savoir plus.

- Connaitre son adresse ip

```bash
ip addr show
```

- Lister les routes

```bash
route -n
```

- Informations similaire à route -n

```bash
ip route show
```

- Voir le temps de réponses des interfaces configurés

```bash
traceroute 8.8.8.8
```

- Vérifier si notre machine peut forwarder

```bash
sudo sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 1
```

- Création d'une route

```bash
sudo ip route 8.8.0.0/16 proto static metric 10 via inet 192.168.1.112 dev enp0s5
# L'adresse ip est celle de notre deuxième serveur ou nous avons vérifié si il forwarder
```

- Vérifier la nouvelle route

```bash
route -n
# On peut aussi faire un traceroute
```

- Supprimer une route

```bash
sudo ip route del 8.8.0.0/16 proto static metric 10 via inet 192.168.1.112 dev enp0s5
# L'adresse ip est celle de notre deuxième serveur ou nous avons vérifié si il forwarder
```

- Vérifier la nouvelle route

```bash
route -n
# On peut aussi faire un traceroute
```

## Ajout d'une adresse IP et d'une route statique
L'administrateur système principal nous a demandé de créer quelques scripts à utiliser par un développeur qui modifieront l'interface réseau.
Ils ont besoin de l'adresse IP 10.0.5.20/24 attribuée à l'hôte et d'une route statique pour fournir l'accès à un autre hôte qui sera provisionné sur un sous-réseau différent avec la spécification 10.0.6.0/24.
Notre système a déjà une adresse de 10.0.5.19/24 attribuée à l'interface ens5.
On nous a demandé de créer le  script /root/net-up.sh, qui ajoutera l'adresse 10.0.5.20/24 à l'interface ens5, et le /root/net-down.shscript qui supprimera la même adresse de la même interface, à l'aide de la commandes ip a.
Il nous a également été demandé que le script /root/net-up.sh ajoute une route afin que l'hôte 10.0.5.5 soit utilisé comme routeur pour fournir l'accès à l'hôte sur le sous-réseau 10.0.6.0/24, en utilisant l'interface ens5 et en utilisant la commande ip r.
Le script /root/net-down.sh doit supprimer la même route de l'interface à l'aide de la commande ip r.
Malheureusement, l'hôte 10.0.6.19/24 n'a pas encore été provisionné, nous devrons donc nous fier à la sortie de la table de routage et ne serons pas en mesure de vérifier la connectivité avec cet hôte.
Une fois que nous pensons que nos scripts net-up.sh et net-down.sh ont été créés et mis à jour, nous devrons vérifier et revérifier qu'ils fonctionnent correctement.

- Utilisez la commande sudo pour démarrer un shell de compte racine
À l'aide de sudo -i, démarrez un root shell interactif:

```bash
sudo -i
```

- Ajoutez et supprimez l'adresse IP 10.0.5.20/24 de l'interface eth0, et créez des scripts net-up.sh et net-down.sh
À l'aide de la commande ip a, ajoutez et supprimez l'adresse 10.0.5.20/24 de l'interface ens5.
Utilisez ces commandes pour créer les scripts net-up.sh et net-down.sh:

```bash
ip a
ip a add 10.0.5.20/24 dev ens5
ip a
echo ip a add 10.0.5.20/24 dev ens5 > net-up.sh
chmod +x net-up.sh
ip a del 10.0.5.20/24 dev ens5
ip a
echo ip a del 10.0.5.20/24 dev ens5 > net-down.sh
chmod +x net-down.sh
./net-up.sh
ip a 
./net-down.sh
ip a
```

- Mettez à jour les scripts net-up.sh et net-down.sh pour ajouter et supprimer une route en utilisant 10.0.5.5 comme routeur pour fournir l'accès au réseau 10.0.6.0/24
À l'aide de la commande ip r, ajoutez une route au sous-réseau 10.0.6.0 en utilisant 10.0.5.5 comme routeur avec le périphérique ens5.
Ajoutez cette commande au net-up.shfichier de script. 
Supprimez la nouvelle route à l'aide de la commande ip r et ajoutez-la au net-down.sh script.

```bash
ip r
ip r add 10.0.6.0/24 via 10.0.5.5 dev ens5
ip r
echo ip r add 10.0.6.0/24 via 10.0.5.5 dev ens5 >> net-up.sh
ip r del 10.0.6.0/24 via 10.0.5.5 dev ens5
echo ip r del 10.0.6.0/24 via 10.0.5.5 dev ens5 >> net-down.sh
ip r
```

- Vérifiez que le script net-up.sh ajoute l'adresse et la route correctes et que le script net-down.sh supprime l'adresse et la route
Exécutez le script net-down.sh.
Vérifiez les informations d'adresse IP actuelles et elles ne doivent pas contenir 10.0.5.20.
Si c'est le cas, essayez de réparer net-down.sh jusqu'à ce que ce ne soit pas le cas:

```bash
./net-down.sh
ip a | grep 10.0.5.20
```

Vérifiez la table de routage et elle ne devrait pas avoir le routeur 10.0.5.5. 
Si c'est le cas, essayez de réparer le net-down.shjusqu'à ce que ce ne soit pas le cas:

```bash
ip r | grep 10.0.5.5
```

Exécutez le script net-up.sh:

```bash
./net-up.sh
```

Vérifiez les informations d'adresse IP actuelles, et elles doivent contenir 10.0.5.20. Si ce n'est pas le cas, essayez de réparer net-up.shjusqu'à ce que ce soit le cas:

```bash
ip a | grep 10.0.5.20
```

Vérifiez la table de routage et elle devrait avoir le routeur 10.0.5.5. Si ce n'est pas le cas, essayez de réparer le net-up.shjusqu'à ce que ce soit le cas:

```bash
ip r | grep 10.0.5.5
```

Vérifiez notre travail en répétant les étapes précédentes de cette tâche.
