# Configurer les limites des ressources utilisateur
Pour garantir la disponibilité et la convivialité de vos serveurs, vous devrez peut-être appliquer des limites à certains utilisateurs ou groupes.
Nous examinerons `/etc/security/limits.conf` comment il peut être utilisé pour limiter l'utilisation des ressources afin de protéger votre système contre les utilisateurs ou groupes gourmands en ressources.

## Gérer les limitations des ressources

- Edition des limitations

```bash
sudo nano /etc/security/limits.conf
```

- Afficher les limites appliqués à votre système

```bash
ulimit -a
```
