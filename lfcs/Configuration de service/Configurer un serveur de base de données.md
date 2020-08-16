#Configuration de service
##Configurer un serveur de base de données
Les bases de données sont une partie importante de nombreuses applications prises en charge par un administrateur système Linux, vous devez donc vous familiariser avec la gestion de diverses bases de données.
Linux a de nombreuses options de base de données disponibles, comme Oracle, PostgreSQL et Mongo, mais deux des plus populaires sont MySQL ou MariaDB.
Nous parlerons un peu des bases de données et installerons et configurerons MariaDB, ainsi que nous examinerons le shell MariaDB.

- Installation de MariaDB en root
```bash
sudo su
apt install mariadb-server mariadb-client
```

- Sécuriser son Installation
```bash
mysql_secure_installation
# Entrer un mot de passe pour l'utilisateur root de votre database et non système
Remove anonymous users? y
Disallow root login remotely? y
Remove test database and access to it? y
Reload privilege tables now? y
```

- Ce connecter à MariaDB
```bash
mariadb -u root -p
```

- Tester l'installation de sa database
```bash
show databases;
```

- Création d'une database
```bash
create databases lalocal;
```

- Ce connecter à une database
```bash
use mysql;
```

- Lister les tables de la database mysql
```bash
show tables;
```

- Sortir de MariaDB
```bash
exit;
```

- Vérifier le status du service mariadb
```bash
systemctl status mariadb
```
