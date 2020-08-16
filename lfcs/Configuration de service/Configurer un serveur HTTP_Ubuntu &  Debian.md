#Configuration de service
##Configurer un serveur HTTP (Ubuntu / Debian)
Avec la croissance exponentielle d'Internet, les compétences liées au Web sont en demande.
Nous allons installer et configurer le serveur Apache2 sur un système Ubuntu.
Vous devriez savoir comment l'installer et où trouver vous-même les fichiers et répertoires clés.

- Vérification de l'état du service Apache
```bash
systemctl status apache2
```
Remarque le service `Apache2` se nomme `httpd` sur un système CentOS/RedHat

- Installation des paquets Apache depuis CentOS/RedHat
```bash
sudo yum install httpd
```

- Installation des paquets Apache depuis Ubuntu/Debian
```bash
sudo apt install apache2
systemctl status apache2
```

- Vérification du fonctionnement de la page home de Apache
```bash
lynx localhost
```

- Vérification du répertoire de configuration de Apache
```bash
cd /etc/apache2
ls -alh
```
apache2.conf = Le fichier principale de configuration
ports.conf = Informations sur la configuration du port de connexion
conf-available & conf-enabled sont des dossiers contenant des fichiers de configuration spécifique
mods-available & mods-enabled contiennent les modules installés et disponible pour l'utilisation
sites-available & sites-enabled contiennent les informations sur les sites web hébergés par Apache
Autres informations le nom de dossier qui contient `available` contiennent les fichiers de configuration
Les dossiers se terminant par `enabled` contiennent un lien symbolique vers les informations du répertoire disponible.

- Pour comprendre le lien symbolique
```bash
ls -alh /etc/apache2/conf-available/
```
```bash
ls -alh /etc/apache2/conf-enabled/
```
# Examiné les liens symboliques de conf-enabled ;)

- site-available
```bash
ls -alh /etc/apache2/sites-available/
000-default.conf
#Contient les informations de notre site Web par défault, nous l'avons examiné lors de notre test avec la commande lynx
default-ssl.conf
#C'est un fichier de configuration ssl
```

- site-enabled
```bash
ls -alh /etc/apache2/sites-enabled/
000-default.conf -> ../etc/apache2/sites-available/000-default.conf
#Contient un lien symbolique vers le répertoire /etc/apache2/sites-available/
```

- Consulter les informations mise en place par Apache
```bash
ls -alh /etc/apache2/
nano apache2.conf
```

- 000-default.conf
```bash
nano /etc/apache2/sites-available/000-default.conf
```
<VirtualHost *:80> = Utilisation du port 80
DocumentRoot /var/www/html = Nous indique le répertoire qui est utilisé par défault
ErrorLog & CustomLog = Contiennent les logs
