# Sécurisation du serveur de base de données MariaDB
Il ne suffit pas qu'un administrateur système sache simplement comment installer et activer un service de serveur de base de données.
Dans le monde actuel des menaces de cybersécurité, il est également très important de savoir comment sécuriser correctement le serveur de base de données.
Il est même essentiel de savoir créer des bases de données, des utilisateurs de bases de données et accorder l'accès aux bases de données aux utilisateurs.
Dans cette activité, nous installerons le serveur MariaDB, configurerons le service pour qu'il soit sécurisé, créerons un administrateur de base de données, créerons une base de données et lui accorderons des privilèges administratifs.

On nous a demandé d'installer un nouveau serveur MariaDB et de nous assurer qu'il est correctement sécurisé.
On nous a également demandé de créer une base de données people et un utilisateur dbadmin qui en a le contrôle administratif total.
Nous aurons besoin d'installer les mariadb-server et les packages mariadb et sécuriser le serveur en définissant le mot de passe root L12i3n4u5Xrockset en cours d' exécution mysql_secure_installation.
Lorsque vous interagissez avec ce programme, définissez les utilisateurs anonymes à supprimer, la connexion root à distance à interdire , les testbases de données à supprimer et les tables de privilèges rechargées immédiatement.
Nous devons également créer une base de données nommée people et une connexion à la base de données pour un utilisateur nommé ’dbadmin’@‘localhost’.
Cet utilisateur doit disposer de tous les droits de gestion de la base de données people et doit avoir un mot de passe défini qui est SeQueL2001.
Utilisez le client mysql pour créer cette base de données, l'utilisateur dbadmin et pour accorder les privilèges appropriés.
Pour vérifier que la configuration est terminée, nous tenterons d'obtenir un accès administratif à la peoplebase de données en tant ’dbadmin’@‘localhost’qu'utilisateur.

- Installer les packages logiciels mariadb et mariadb-server
Utilisez YUM pour installer mariadb-server et les packages de mariadb:

```bash
sudo yum -y install mariadb-server mariadb
```

- Assurez-vous que le service mariadb.service démarre et est activé pour démarrer au moment du démarrage
Utilisez la commande systemctl pour activer et démarrer le mariadb.service, puis vérifiez son état:

```bash
sudo systemctl enable mariadb.service --now
sudo systemctl status mariadb.service
```

- Sécurisez le serveur de base de données mariadb en définissant le mot de passe root, en supprimant les utilisateurs anonymes, en n'autorisant pas les connexions racine à distance, en supprimant les bases de données de test et en rechargeant les privilèges
Utilisez mysql_secure_installation pour définir le mot de passe root du serveur de base de données sur L12i3n4u5Xrocks.
Suivez ensuite les instructions pour supprimer les utilisateurs anonymes, interdire les connexions root à distance , supprimer la base de données test et recharger immédiatement les tables de privilèges:

```bash
sudo mysql_secure_installation
```

- Créez les personnes de la base de données et l'utilisateur dbadmin, puis accordez à 'dbadmin' @ 'localhost' l'accès complet à la base de données des personnes
Utilisez la commande client de base de données de ligne de commande mysql pour vous connecter à la base de données en tant qu'utilisateur root avec le mot de passe L12i3n4u5Xrocks.
Créez une base de données nommée people, un 'dbadmin'@'localhost'utilisateur identifié par le mot de passe SeQuel2001.
Ensuite, accordez tous les droits sur la base de données people au nouvel utilisateur.

```bash
mysql -u root -p  # Enter the password when prompted: L12i3n4u5Xrocks
create database people;
create user 'dbadmin'@'localhost' identified by 'SeQeuL2001';
grant all on people.* to 'dbadmin'@'localhost';
quit
```

- Vérifiez que l'utilisateur dbadmin dispose d'un accès complet à la base de données des personnes
Utilisez mysql pour vous connecter en tant qu'utilisateur dbadmin et fournir le mot de passe SeQeuL2001.
Utilisez la base de données people, créez et supprimez une table test minimale, pour vérifier les privilèges administratifs et quitter:

```bash
mysql -u dbadmin -p
use people;
create table test (id text);
drop table test;
exit
```
