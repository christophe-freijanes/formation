# Créer et configurer un stockage chiffré
Le contrôle de l'accès des utilisateurs n'est parfois pas suffisant lorsque vous essayez de protéger des données sensibles et peut créer un défi pour un administrateur système Linux.
La création d'un système de fichiers qui peut être verrouillé et déverrouillé selon les besoins est un autre outil précieux dans l'arsenal de l'administrateur système Linux. 
Nous examinerons comment `cryptsetup` créer un stockage crypté et nous assurerons que nos informations sont protégées.

- Vérifier si son stockage est crypté

```bash
grep -i config_dm_crypt /boot/config-$(uname -r)
#CONFIG_DM_CRYPT=m # Signifie que le module est chargé
```

- Installer le module pour chiffré

```bash
apt install cryptsetup
```

- Lister ses partitions

```bash
lsblk
```

- Afficher toutes les options de cryptsetup

```bash
cryptsetup
```

- Création d'une partition crypté

```bash
cryptsetup -y luksFormat /dev/sdb1
# Faire YES et rentrer une passphrase
```

- Déverrouillage de notre partition crypté

```bash
cryptsetup luksOpen /dev/sdb1 secret
# Rentrer votre passphrase
lsblk
```

- Monter notre nouvelle partition crypté

```bash
mkfs.ext4 /dev/mapper/secret
cd /mnt/
mkdir encrypted
ls -alh
mount /dev/mapper/secret /mnt/encrypted
df -h
```

- Créer un fichier dans notre partition crypté

```bash
echo 'Ceci est un test' > encrypted/fichiersecret.txt
ls -alh /mnt/encrypted
```

- Démontage de la partition crypté

```bash
umount /mnt/encrypted
cryptsetup luksClose secret
ls -alh /mnt/encrypted
df -h
```

- Rouvrir et remonter la partition crypté secret

```bash
cryptsetup luksOpen /dev/sdb1 secret
# Rentrer votre passphrase
lsblk
mount /dev/mapper/secret /mnt/encrypted
df -h
ls -alh /mnt/encrypted
```
