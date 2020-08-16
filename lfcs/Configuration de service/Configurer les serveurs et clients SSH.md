#Configuration de service
##Configurer les serveurs et clients SSH
En tant qu'administrateur système Linux, vous utiliserez probablement SSH quotidiennement pour vous connecter à vos systèmes.
Secure Shell est le protocole d'accès à distance standard utilisé pour se connecter à des serveurs partout dans le monde.
Nous examinerons de plus près les fichiers de configuration pour SSH, ainsi que le processus de génération d'une clé avec ssh-keygen.
Vous devriez vous sentir à l'aise pour configurer SSH et générer vos propres clés.

#SSH fichiers de configuration
System-wide configuration serveurs
    /etc/ssh/sshd_config
System-wide client configuration
    /etc/ssh/ssh_config
Utilisateur spécifique client configuration
    ~/.ssh/config

- Modifier les options de connexion (par exemple changer la connexion en utilisant le port 22)
```bash
less /etc/ssh/sshd_config
```

- Ce connecter avec ssh sur votre serveur distant
```bash
ssh username@192.168.0.10
```

- Générer une clé ssh
```bash
ssh-keygen
# La première question vous demande ou sauvegarder vos clés "laisser par défaut en tapant entrée"
# La seconde est une seconde sécurité que je vous recommande en rentrant une passphrase
# Maintenant vos clés privé et public ont été créée et contiendra une empreinte digitale
```

- Vérifier que vos clés éxites
```bash
cd ~/.ssh
ls -alh
```
La clé publique est à installer sur votre serveur distant pour vous permettre de vous connecter.
La clé privé doit rester sur votre poste et ne doit jamais être partagé !

- Copie de votre clé ssh public vers le serveur distant
```bash
cd ~/.ssh
ssh-copy-id ssh username@192.168.0.10
# Vous devez rentrer votre mot de passe
```

- Test de connexion sur votre serveur distant
```bash
ssh username@192.168.0.10
# Si votre configuration est bien, vous devez vous connecter sans mot de passe
```

- Afficher les clés ssh authorisées à ce connecter sur votre serveur distant
```bash
cd ~/.ssh
ls -alh
cat authorized_keys
```

- Pour vous déconnectez de votre système
```bash
exit
```

- Afficher et comparer votre clé public et celle par exemple de votre serveur distant
```bash
cd ~/.ssh
ls -alh
cat id_rsa.pub
```
Si pour une raison ou une autre la commande `ssh-copy` ne fonctionne pas
On pourrait copier le contenu, prendre la main sur le serveur distant et éditer le fichier présent dans ~./.ssh/authorized_keys

- En cas de problème de copie de notre id_rsa
Utiliser ce petitt script :) 
```bash
cat ~/.ssh/id_rsa.pub | ssh username@192.168.0.10 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

- Vérifier une fois copier manuellement avec notre script les clés ssh authorisées à ce connecter sur votre serveur distant
```bash
cd ~/.ssh
ls -alh
cat authorized_keys
```
