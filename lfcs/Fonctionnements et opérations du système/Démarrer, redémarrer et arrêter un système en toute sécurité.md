# Démarrer, redémarrer et arrêter un système en toute sécurité
La nécessité de redémarrer et / ou d'arrêter correctement un système est essentielle à la stabilité et à la sécurité d'un système.
Malheureusement, ce n'est pas aussi simple que de retirer la fiche du mur.
Nous allons examiner l'utilisation de la `shutdown` commande pour arrêter, redémarrer, éteindre et arrêter un système.

## Avant-tout
- Connaitre le temps d'activité de son serveur

```bash
uptime
```

### Exemple

- Identifier la commande shutdown

```bash
which shutdown
ls -lhF /sbin | grep shutdown
```

On constate que notre commande est un lien symbolique vers /bin/systemctl*

- Identifier plusieurs commandes

```bash
ls - lhF /bin | grep 'shutdown\|poweroff\|halt\|reboot'
```

- Redémarrer maintenant

```bash
sudo shutdown -r now
```

- Redémarrer avec un temps spécifié

```bash
sudo shutdown -r +5
```
