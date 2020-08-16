# Activation de l'accès su / sudo avec Wheel Group
Les administrateurs système se connectent rarement à un système en rootraison d'un certain nombre de risques de sécurité.
Certaines distributions désactivent même le rootcompte pour commencer.
Restreindre la possibilité d'utiliser les rootprivilèges à des utilisateurs sélectionnés est un élément important du maintien d'un système sécurisé.
Vous apprendrez à sécuriser les commandes `su` et `sudo` en limitant leur utilisation aux membres du groupe `wheel`.

- Cas Pratique
Afin de rendre un système plus sécurisé, il nous a été demandé de restreindre l'accès aux commandes `su` et `sudo`.
Seuls les membres du groupe `wheel` doivent être autorisés à exécuter ces commandes.
Nous devrons créer `/etc/sudoers.d/wheel.grp`, ce qui permettra aux membres du groupe `wheel` d'utiliser la commande `sudo`.
De plus, seuls les membres du groupe `wheel` doivent être autorisés à utiliser la commande `su` (changer d'utilisateur).
La résolution de ce problème est un processus en deux étapes.
Tout d'abord, nous devrons activer les autorisations `/usr/bin/su` afin que seuls les membres du groupe `wheel` puissent l'exécuter.
Ensuite, nous devons modifier `/etc/pam.d/su` (le fichier du module d'authentification enfichable) et exiger que l'utilisateur soit également membre du groupe `wheel`.

- Confirmez que votre utilisateur est dans le groupe wheel et définissez les fichiers /usr/bin/sudo et /usr/bin/su afin qu'ils puissent être exécutés par l'utilisateur racine et le groupe wheel
Utilisez les commandes `id` et `groups` pour confirmer votre appartenance au groupe  wheel

```bash
id
groups
```

Utilisez `sudo` pour devenir l'utilisateur root

```bash
sudo -i
```

Exécutez `chgrp` pour définir le groupe `wheel` comme propriétaire de `/usr/bin/sudo` et `/usr/bin/su`

```bash
chgrp wheel /usr/bin/sudo /usr/bin/su
```

Utilisez `chmod` pour définir les autorisations les plus sécurisées et permettre à l'utilisateur `root` et au groupe `wheel` d'exécuter `sudo` et `su`

```bash
chmod 4110 /usr/bin/sudo /usr/bin/su
# Pour vérifier les modifications
ls -alh
```

- Utiliser `visudo` pour confirmer, créer ou supprimer les commentaires permettant au groupe `wheel` d'utiliser `sudo`
Pour modifier ou vérifier `/etc/sudoers` autorise le groupe `wheel` à utiliser `sudo`, utilisez la commande `visudo`

```bash
visudo
#Aller à la ligne
%wheel  ALL=(ALL)       ALL
```

La ligne doit être décommenté.
Il se trouve généralement à proximité de la ligne root.
Enregistrez les modifications apportées au fichier et quittez.

Utilisez `grep` pour vérifier que la ligne est là.

```bash
grep wheel /etc/sudoers
```

- Décommenter ou créer une ligne dans `/etc/pam.d/su` pour exiger l'appartenance au groupe `wheel` pour l'utilisation de la commande `su`
À l'aide de l'éditeur de votre choix, décommentez ou créez un test "d'authentification" supplémentaire sous la ligne se terminant par `pam_rootok.so`. La ligne devrait ressembler à ceci

```bash
auth            required        pam_wheel.so use_uid
```

-Créez un utilisateur sysadmin, faites-le devenir membre du groupe wheel, définissez son mot de passe et vérifiez que sysadmin est capable d'utiliser `sudo` et `su`

```bash
# Créez l' sysadminutilisateur et faites-en un membre du wheelgroupe:
useradd -G wheel sysadmin
# L'exécuter de cette façon fonctionnerait aussi
#useradd sysadmin
#usermod -aG wheel sysadmin
# Définir le mot de passe utilisateur de sysadmin
passwd sysadmin
```

Vérification de l'exécution de `su` et de `sudo`

```bash
su - sysadmin
sudo tail -n1 /etc/shadow
su -l username
exit
exit
```

- Créez un utilisateur, sysuser, qui n'est pas membre du groupe `wheel`, définissez son mot de passe et vérifiez qu'il ne peut pas utiliser sudo et su
Créez l'utilisateur sysuser et n'en faites pas un membre du groupe `wheel`

```bash
useradd sysuser
passwd sysuser
```

La vérification sysuser de ne pas pouvoir exécuter su et sudo

```bash
su --login sysuser
sudo tail -n1 /etc/shadow
su -l username
exit
exit
```

Les commandes sudo et su devraient avoir toutes deux échouées.
