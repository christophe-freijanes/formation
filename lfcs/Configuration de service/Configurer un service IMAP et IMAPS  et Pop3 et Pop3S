#Configuration de service
##Configurer un service IMAP et IMAPS (et Pop3 et Pop3S)
Les administrateurs système Linux gèrent les serveurs de messagerie depuis longtemps, avec une variété d'options disponibles.
Vous pouvez être chargé d'installer et de gérer un serveur de messagerie, il peut donc être utile de comprendre les bases de POP3 et IMAP.
Nous installerons Dovecot pour nos services IMAP et POP3.
Vous serez à l'aise avec l'installation et la gestion de Dovecot pour configurer votre propre serveur de messagerie.

- Vérifier le groupe postfix
```bash
cat /etc/group | grep -e mail -e postfix
```

- Lister les utilisateurs
```bash
ls -alh /var/mail
```

- Installer notre serveur de messagerie
```bash
sudo apt install dovecot-core
```

- Vérifier les fichiers de configuration
```bash
cd /etc/dovecot
ls -alh
```

- Trouver la localisation de notre mail
```bash
cd /etc/dovecot/conf.d
ls -alh
sudo nano 10-mail.conf
mail_location = mbox:~/mail:INBOX=/var/mail/%u
# %u = username
mail_priviliged_group = mail
```

- Installer les protocoles pop et IMAP
```bash
sudo apt install dovecot-pop3d dovecot-impad
```

- Vérifier les certificats ssl
```bash
cd /etc/dovecot/
sudo ls -alh private/
# On doit voir un lien symbolique pointant vers la localisation de nos certificats
```

- Script pour générer les certificats si il n'existe pas lors de notre vérification précédente
```bash
ls -alh /usr/share/dovecot
# Nous devons voir mkcert.sh
```

- Seconde vérification de nos fichiers ssl
```bash
cd /etc/dovecot/conf.d
ls -alh
sudo nano 10-ssl.conf 
```
Vérifier si le chemin de ssl_cert & ssl_key sont correct

- Pour que les modifications et/ou nouvelles fonctionnalités soient prise en compte
```bash
sudo systemctl restart dovecot
```

Vérification de communication de notre serveur de messagerie
```bash
sudo netstat -nptlu | grep dovecot
# Port 110 POP3
# Port 143 IMAP
# Port 993 IMAPS
# Port 995 POP3S
```
