# Installer, configurer et dépanner les chargeurs de démarrage
Un chargeur de démarrage gère toutes les activités qui doivent se produire avant de pouvoir démarrer dans votre système d'exploitation.
Nous parlerons du rôle d'un chargeur de démarrage, de ce qui entre dans la configuration d'un chargeur de démarrage, puis jetons un œil à GRUB2 (le chargeur de démarrage le plus courant).
Nous examinerons également les fichiers qui configurent et construisent le menu du chargeur de démarrage.

## Debian/Ubuntu

```bash
/boot/grub/grub.cfg
```

## RedHat/CentOS

```bash
/boot/grub2/grub.cfg 
```

## GRUB

- Editer le grub

```bash
nano /boot/grub/grub.cfg
```

- Lister les fichiers utilisé par votre grub

```bash
ls -l /etc/grub.d
```

- Modifier le thème de votre grub

```bash
nano /etc/grub.d/05_debian_theme
```

- Rajouter une entrée à votre menu grub

```bash
nano /etc/grub.d/40_custom
```

- Editer les options de démarrage de votre grub

```bash
nano /etc/default/grub
```

- Mettre à jour vos nouvelles informations de votre grub

```bash
sudo update-grub
```
