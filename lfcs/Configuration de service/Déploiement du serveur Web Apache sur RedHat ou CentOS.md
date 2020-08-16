# Déploiement du serveur Web Apache sur RedHat ou CentOS
Les administrateurs système doivent savoir comment travailler avec des serveurs Web, car ils sont très courants.
Dans cette activité, vous apprendrez comment dépanner un site Web hôte virtuel qui ne fonctionne pas et comment en créer un autre.

Notre premier objectif est de déterminer pourquoi site1 ne répond pas.
Nous vérifierons que les packages logiciels serveur httpd et client lynx sont installés et les installerons si nécessaire.
Nous nous assurerons que le httpd.service est activé, démarré et desservi http://site1.linuxacademy.com en utilisant le client lynx.
Notre deuxième objectif est de permettre site2. 
Nous allons utiliser site1 comme modèle, en copiant et en modifiant son fichier de configuration pour créer http://site2.linuxacademy.com .
Jusqu'à ce qu'une entrée DNS soit ajoutée, nous mettrons à jour notre le fichier /etc/hosts pour prendre en charge le nouveau site.

- Vérifiez que le serveur Web Apache et le client Web Lynx sont installés et installez les packages si nécessaire
À l'aide de la commande yum, répertoriez les packages httpd et lynx pour voir s'ils sont installés.
S'ils ne sont pas installés, installez-les:

```bash
sudo -i
yum list httpd lynx
yum -y install lynx
```

- Résoudre les problèmes de site1.linuxacademy.com
À l'aide de la commande systemctl, affichez l'état du httpd.service.
S'il n'est pas activé, activez-le et démarrez le service.
Vérifiez avec le navigateur lynx que http://site1.linuxacademy.com est disponible:

```bash
systemctl status httpd.service
systemctl enable httpd.service --now
systemctl status httpd.service
lynx http://site1.linuxacademy.com
# Appuyez sur Maj + Q pour quitter lynx.
```

- Configurer l'hôte virtuel pour site2
Répertoriez les répertoires /var/www et /var/www/site1.
Créez un répertoire pour le deuxième site que nous allons configurer:

```bash
ls /var/www
ls /var/www/site1
mkdir /var/www/site2
```

- Utilisez sed pour éditer le fichier site1.conf et créer un fichier site2.conf:

```bash
cd /etc/httpd/conf.d
cat site1.conf
sed 's/site1/site2/g' site1.conf > site2.conf
cat site2.conf
```

Remplissez la page index.html pour le site2:

```bash
echo site2 > /var/www/site2/index.html
```

- Ajouter une entrée à /etc/hosts pour le site2.linuxacademy.com
Ajoutez la ligne suivante à /etc/hosts:

```bash
10.0.0.116 site2 site2.linuxacademy.com
```

- Redémarrez httpd.service et vérifiez que site2 est en cours d'exécution
À l'aide de la commande systemctl, redémarrez httpd.service et utilisez lynx pour afficher le site http://site2.linuxacademy.com : et le site http://site1.linuxacademy.com :

```bash
systemctl restart httpd.service
lynx http://site2.linuxacademy.com
# Appuyez sur Maj + Q pour quitter lynx
```

Vérifiez que le site1 fonctionne toujours correctement.

```bash
lynx http://site1.linuxacademy.com
# Appuyez sur Maj + Q pour quitter lynx
```
