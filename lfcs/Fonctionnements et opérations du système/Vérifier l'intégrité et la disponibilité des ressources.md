# Vérifier l'intégrité et la disponibilité des ressources
Que sont exactement les ressources système? Les ressources système sont des composants d'un système informatique et comprennent la mémoire (RAM), les disques durs, le processeur et les E/S réseau (entrée / sortie), pour n'en citer que quelques-uns.
Nous allons examiner comment dépanner la mémoire et les disques durs à l'aide des outils `memtest86+` et `fsck`.

## memtest86

Pour faire un test de la mémoire, il faut impérativement passé par le GRUB menu.
Il n'est pas possible de le faire pendant l'exécution de son système.
Une fois le long test fait, redémarrer sur votre session.

## fsck

- Vérifier les partitions

```bash
df -h
```
- Démonter un point de montage (FS)

```bash
sudo umount /media/linux/data
```

- Informations système sur les partitions et lecteur disponible

```bash
sudo fsck /dev/sdb
```

- Planifier un check après un redémarrage

```bash
sudo tune2fs -c 1 /dev/sdb
```

- Déplanifier un check après un redémarrage

```bash
sudo tune2fs -c 0 /dev/sdb
```
