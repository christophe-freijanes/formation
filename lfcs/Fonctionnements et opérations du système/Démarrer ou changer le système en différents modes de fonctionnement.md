# Démarrer ou changer le système en différents modes de fonctionnement
Les systèmes Linux peuvent fonctionner dans une grande variété de modes pour diverses raisons:
Mode utilisateur uniquement pour la récupération (utile pour dépanner un système problématique)
Mode ligne de commande (bien pour la gestion du serveur)
Mode graphique (courant pour l'accès au bureau).
Nous passerons en revue les différents modes de fonctionnement et verrons comment changer temporairement et définitivement le mode de fonctionnement d'un système.

## Les différents modes de fonctionnement
- Connaitre son mode de fonctionnement

```bash
systemctl get-default
```

- Savoir le niveau de son mode de fonctionnement

```bash
runlevel
```

Il existe actuellement 6 mode de démarrage.

- Changer son mode de fonctionnement

```bash
systemctl set-default runlevel3.target
```

Depuis le menu GRUB lors d'un redémarrage on peut éditer le mode de démarrage de notre système, il faut choisir la touche e de votre clavier pour éditer votre runlevel.
On peut éditer la ligne suivante :

```bash
fi 
linux   /boot/vmlinux-5.0.0.35-generic root-UUID=0c9807665-1234-166j-aaa5-123cff\1c1cd2 ro quiet splash $vt_handoof (mettre son chiffre correspondant au mode de démarrage souhaité)
...
```
