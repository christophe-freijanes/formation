#Configuration de service
##Configurer les alias de messagerie
Avez-vous besoin d'envoyer une copie de tous les e-mails reçus par une adresse à une autre ou d'envoyer des e-mails de compte de service à un utilisateur spécifique pour éviter de gérer plusieurs boîtes aux lettres? 
En tant qu'administrateur système Linux, vous pouvez simplifier les e-mails du système de gestion pour un serveur Linux en définissant des alias pour le système de messagerie de votre choix.
Nous allons jeter un œil à la configuration d'alias pour Postfix qui résout ces deux scénarios.
Vous pourrez acheminer les e-mails selon vos besoins en utilisant des alias.

- Lister les utilisateurs du système
```bash
ls -alh /home
```

- Création d'un alias
```bash
cd /etc/postfix
ls -alh
# Si il n'existe pas en faire la création de notre fichier d'alias
sudo nano aliases
webmaster: user1
user2: user3
# Le compte Webmaster recevra toujours son mail, mais une copie sera envoyé à user1
webmaster: webmaster,user1
# Configurer un alias qui lors de l'envoi d'un mail à un utilisateur, il sera également envoyé à plusieurs utilisateurs similaire (principe de liste de distribution)
urgent: user5,user6,user3
# Dernier type d'alias possible envoi des messages locaux d'un utilisateur depuis un compte externe @notrealdomain.com
user2: notarealaccount@notrealdomain.com
```
```bash
# Valider votre nouvelle configuration
sudo postalias /etc/postfix/aliases
```
