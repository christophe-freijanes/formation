# Restreindre l'accès à une page Web
La gestion des serveurs Web est une compétence importante, mais en tant qu'administrateur système Linux, vous devez être en mesure de sécuriser vos sites Web afin d'empêcher tout accès non autorisé.
Il existe de nombreuses façons pour un administrateur Linux de sécuriser un site Web, nous expliquerons comment utiliser les adresses IP pour restreindre l'accès à une page Web dans Apache2.
Nous examinerons la configuration nécessaire et enfin comment tester et dépanner la configuration.
Vous serez en mesure de gérer l'accès à un site Web et de savoir comment tester et dépanner le fichier de configuration.

Les bonnes pratiques veulent qu'avant chaque modification d'un fichier de configuration d'en faire une copie.
Il est recommandé aussi de vérifier votre nouvelle configuration en utilisiant la commande suivante :

```bash
apachectl checkconfig
# Si ok
systemctl restart apache2
```

- Vérifier le contenu du dossier www

```bash
ls -alh /var/www/html
#Dans le cadre de la démo on a créér un site tester
test/
ls -alh /var/www/html/test/
index.html
```

- Tester votre page index.html

```bash
lynx localhost
```

On peut tester votre la page par défaut avec son navigateur habituelle (firefox par exemple)
La test page est bien dans 192.168.0.12/test/index.html
Si on fait un retour en arrière on se retrouve bien dans la page par défaut 192.168.0.12/index.html

- Mettre en place des restrictions à deux endroits

```bash
cd /etc/apache2
ls -alh
sudo nano apache2
# Depuis la section <Directory />
# Création d'une nouvelle entrée
<Directory /var/www/html/test/>
        Order Allow,deny
        Allow from 172.10.10.1 #Dans cet exemple on autorise uniquement la connexion depuis ce serveur, nous pouvons indiquer un subnet
        Allow from 127 # On autorise les connexions local en ipv4
        Allow from ::1 # On autorise les connexions local en ipv6
        Alow from 136.34 # Ceci est mon adresse externe qui permettra de ce connecter
</Directory>
```

- Tester sa configuration Apache

```bash
sudo apachectl configtest
# Syntax OK
systemctl restart apache2
lynx localhost
```
