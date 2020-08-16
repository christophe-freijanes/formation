#Configuration du serveur de courrier sortant
Pour de nombreuses raisons, le service de messagerie est essentiel.
Être capable de configurer un serveur de messagerie est quelque chose que chaque administrateur système doit savoir faire.
Un peu de pratique pour faire exactement cela.
Par défaut, seul le courrier local est disponible et il ne peut pas être envoyé ou reçu de notre réseau.
Dans cette activité, vous allez reconfigurer le serveur de messagerie Postfix pour prendre en charge l'envoi et la réception d'e-mails à partir du réseau.

Par défaut, le courrier n'est disponible que localement, pas sur le réseau.
On nous a demandé de configurer le système pour envoyer le courrier sortant, en utilisant Postfix, afin que les rapports du système puissent être envoyés par courrier à l'administrateur système principal.
Nous devons installer les mailx, mutt et les paquets postfix.
Nous utiliserons la commande postconf pour afficher et configurer les paramètres de Postfix.
Ensuite, nous enverrons un message mail de test, en nous assurant qu'il est correctement reçu en affichant /var/log/maillog et en utilisant le client de messagerie Mutt.

- Installez le serveur de messagerie Postfix et les clients mailx et Mutt Mail
Devenez l'utilisateur sudo root et utilisez la commande yum pour installer le logiciel du serveur de messagerie Postfix, ainsi que les clients de messagerie mailx et Mutt:
```bash
sudo -i
yum -y install postfix mailx mutt
```

- Configurer Postfix pour écouter sur toutes les interfaces réseau
Utilisez la commande postconf pour configurer le serveur de messagerie Postfix pour qu'il écoute sur toutes les interfaces réseau:
```bash
postconf -e inet_interfaces=all
```
- Activer et démarrer le service postfix
Utilisez la commande systemctl pour activer et démarrer le service postfix:
```bash
systemctl enable postfix.service --now
```

- Envoyez un message de test avec la commande mail et vérifiez le journal pour voir s'il a été livré
À l'aide de la commande mail, envoyez un message avec l'objet test à mon_user qui contient le contenu du fichier /etc/hosts:
```bash
mail -s 'test' mon_user@server1 < /etc/hosts
```

- Vérifiez que le courrier sortant fonctionne
À l'aide de la commande tail, vérifiez que le message a été remis.
Revenez au compte mon_user et affichez le message à l'aide de la commande mutt:
```bash
tail /var/log/maillog
exit
mutt
# Appuyez sur Entrée pour créer le Mailrépertoire dans notre répertoire personnel si nécessaire.
# Appuyez sur q pour quitter mutt.
```
