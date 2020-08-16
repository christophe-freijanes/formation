# Restreindre l'accès aux serveurs proxy HTTP
Il est essentiel de protéger les systèmes pour assurer la sécurité de vos utilisateurs et de vos données, ainsi que de suivre les bonnes pratiques réseau.
Nous allons jeter un œil à Squid et voir comment l'utiliser pour mettre en cache et filtrer les requêtes http pour des réseaux et des hôtes particuliers.
Vous saurez où aller pour vérifier et mettre à jour votre configuration afin d'autoriser uniquement les connexions d'hôtes appropriées.

Squid est serveur proxy qui permet de filtrer les demandes vers un serveur.
- Squid fichiers de configuration
    - acl - Liste des contrôles accès
    - http_access - accorder ou refuser les accès basés ACLs
    - http_port - port que Squid écoute
    - core_dump - répertoire dans lequel le fichier de vidage de mémoire est stocké
    - refresh_pattern - valeur utilisée pour déterminer si un objet mis en cache est périmé et doit être actualisé

- Répertoire Squid

```bash
cd /etc/squid
ls -alh
```

- Vérifier la configuration de squid

```bash
nano squid.conf
#On peut analyser toutes les informations de notre proxy Squid avant de faire un changement
```

- Vérifier la configuration de squid.conf.clean

```bash
sudo nano squid.conf.clean
```

Depuis ce fichier on peut constaté :
- acl - local network sources
Cette partie est générallement commenté

- acl - port entries
Que les acls sont utilisées pour définir les ports considérés comme sûrs.
Nous pouvons aussi configurer les adresses IP

- http_acces entries
Les entrées d'accès au protocole comme http est autorisé ou refusé sur la base des acls.
!Safe_ports veut dire que l'on refusé l'accès
Exemple
http_acces deny !Safe_ports = Nie toutes les demandes aux ports qui ne sont pas dans le coffre-fort des ports
http_acces deny CONNECT !SSL_ports =  La règle acl refusera la connexion à un autre port qu'un port SSL. 

- Squid normally listens to port 3128
C'est ici que l'on pourra changer la valeur du port si nous avons besoin.

- Leave coredumps in the first cache dir
Nous pouvons ici changer le répertoire de stockage des cores dumps.

- Add any of your own refresh_pattern entries above these.
Dans cette partie on détermine la durée de stockage des objets.
Si un objet répond aux critères, il sera considéré comme périmé et sera rafraichi

- Cas pratique
Nous allons refusé à une adresse source l'accès à http

```bash
# acl - local network sources
acl target src 10.9.8.7
# http_acces entries - Création d'une nouvelle règle acl
http_acces allow localnet !target
# Cette règle permettra une autorisation à tout le réseau local mais refusera les accès spécifiques
# Pour la prise en compte de vos modifications redémarrer le service Squid
sudo service squid restart 
```
