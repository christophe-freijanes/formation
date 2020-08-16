# Configurer les fichiers journaux du serveur HTTP
De nombreux administrateurs système Linux utilisent un logiciel d'agrégation de journaux ou un logiciel d'analyse similaire pour consolider et gérer les fonctions de reporting.
Nous examinerons les fichiers journaux Apache2 et comment modifier la sortie.
Vous pourrez personnaliser le fichier journal pour répondre à vos besoins en matière de rapports.

## Apache2 fichier log détail

- Lire le format de configuration de notre fichier de log

```bash
cat /etc/apache2/apache2.conf | grep LogFormat
```

- Trouver les indications de notre CustomLog 

```bash
cat /etc/apache2/sites-available/000-default.conf
```

- Editer une nouvelle entrée de nos logs

```bash
sudo nano /etc/apache2/apache2.conf
#Use mod_remoteip instead.
LogFormat "HOST: %h - DATE&TIME: %t - REQUESTED: %r - STATUS: %>s" lacustom
```

```bash
sudo nano /etc/apache2/sites-available/000-default.conf
# Changer la valeur combined par votre nouvelle entrée ici lacustom
CustomLog ${APACHE_LOG_DIR}/access.log lacustom
```

- Faire un test de la configuration de apache

```bash
sudo apachectl configtest
```

- Pour permettre la prise en compte de notre nouvelle configuration

```bash
sudo systemctl restart apache2
```

- Tester depuis son terminal avec le navigateur lynkx

```bash
lynx localhost
```

- Intérroger access.log

```bash
sudo less /var/log/apache2/access.log
```
