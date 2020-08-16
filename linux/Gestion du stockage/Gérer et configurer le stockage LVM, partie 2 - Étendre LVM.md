# Gérer et configurer le stockage LVM, partie 2 - Étendre LVM
Avec LVM, un administrateur système Linux contrôle le stockage disponible et peut étendre ou réduire le stockage disponible selon les besoins.
Nous avons vu comment créer des volumes physiques, des groupes de volumes et des volumes logiques.
Il est maintenant temps de récolter les fruits de ces connaissances.
Nous examinerons comment étendre ou réduire les volumes logiques pour gérer l'espace de stockage disponible.

## Manager LVM

- Création d'une nouvelle partition

```bash
fdisk /dev/sdc
p
n
Partition number # Entrée
First sector # Entrée
Last sector...#  +500M
t
Partition number # Entrée
Hex code # 8e
p
w
# Votre 3ème partitions est créée
```

- Création d'un nouveau volumes 

```bash
lsblk
pvcreate /dev/sdc3
pvs
# On constate que sdc1 & 2 font parti de vg01 sdc3 lui n'impartient à personne
```

- Vérifier en détail les informations de ses volumes

```bash
pvdisplay
```

- Vérifier les informations de ses volumes simplement

```bash
vgs
```

- Vérifier en détail les informations de ses groupes de volumes

```bash
vgdisplay
```
 
- Etendre son groupe de volumes en rajoutant sa nouvelle partition sdc3

```bash
vgextend vg01 /dev/sdc3
vgs
pvs
lvs
```

- Afficher en détail les informations de votre partition LVM

```bash
lvdisplay
```

- Afficher en détail les informations de votre groupe

```bash
vgdisplay
```

- Etendre son volume logique en rajoutant 100 M de disponible

```bash
vgdisplay
# Le chiffre le 348 correspond à 248 + 100 des 124 Free PE / size de disponible
lvextend -l 348 /dev/vg01/lv01
lvs
```

- Redimensionnement du FS

```bash
resizefs /dev/vg01/lv01
df -h
```

- Autre commandes

Volumes physiques
pvmove # Déplacer et étendre un volume physique
pvremove # Supprime l'étiquette d'un volume physique LVM ne le verra plus

Groupe de volumes
vgreduce # Supprimer un volume physique
vgremove # Supprimer un groupe de volumes pour un volume logique
lvreduce # Supprime l'espace de stockage du volume logique
lvremove # Supprime le volume logique du système
