# Maintenir une zone DNS
DNS est la liste de contacts d'Internet, et si vous disposez d'un domaine, vous devrez peut-être créer les fichiers de zone appropriés pour votre serveur DNS.
Nous allons passer en revue les types d'enregistrements et les procédures dont vous aurez besoin pour gérer votre propre zone DNS.
Vous pourrez identifier tous les fichiers de configuration nécessaires pour exécuter une zone, décrire les différents types d'enregistrement (enregistrement SOA, A, MX, NS et CNAME) et gérer un bloc SOA pour votre zone.

- Ajouter une nouvelle zone

```bash
sudo nano named.conf.local
```

- Editer le fichier named.conf.local

```bash
zone "la.local" IN {
     type master;
     file "/etc/bind/fwd.la.local.db";
     allow-update { none; };
};
zone "1.168.192.in-addr.arpa" IN {
     type master;
     file "/etc/bind/fwd.la.local.db";
     allow-update { none; };
};
```

- Editer le forwader de votre zone dns

```bash
nano /etc/bind/fwd.la.local.db
```

- Explication du fwd.la.local.db
@ : indique le début d'autorité
Serial : ors du l'intégration d'un nouveau serveur pensez à changer le serial pour la prise en compte de vos changements.
Refresh : temps de rafraîchissement
Retry : 86400 = 24h
Expire : temps d'expiration

;Name Server Information # Information sur les serveurs DNS
;IP address of Name Server # IP des serveurs DNS #IN A
;Mail Exchanger #Enregistrement du serveur de messagerie # IN MX 10=Valeur d'enregistrement, cette valeur permet d'avoir plusieurs serveurs
;A - Record HostName To Ip Address
www     IN  A   192.168.1.100 (Le serveur nommé www est lié A l'adresses IP)
mail    IN  A   192.168.1.110 (Le serveur nommé mail est lié A l'adresses IP)
file1   IN  A   192.168.1.120 (Le serveur nommé file1 est lié A l'adresses IP)
;CNAME Record
ftp     IN  CNAME  www.la.local. (Canonique Name permet de voir le nom de votre serveur comme  un alias, ceci permet de référencer un serveur existant avec un autre nom)

- Editer le reverse de votre zone dns

```bash
nano /etc/bind/rev.la.local.db
```

- Explication du rev.la.local.db
Les informations global @, serial, refresh... son similaire à celle de au-dessus
;Name Server Information #Information sur les serveurs DNS
;Reverse lookup for Name Serveur # Ici on trouve les mêmes serveurs dns que dans Name Server Information
10  IN  PTR ns1.la.local. (1 pour le premier octect du serveur ns1)
20  IN  PTR ns2.la.local. (2 pour le second octect du serveur ns2)
PTR est un pointeur d'enregistrement

;PTR Record IP adress to HostName #
100 IN  PTR www.la.local.
110 IN  PTR mail.la.local.
120 IN  PTR file1.la.local.

- Vérification de la configuration de la zone DNS

```bash
sudo named-checkconf
```

- Prise en compte des changements de la configuration

```bash
sudo systemctl restart bind9
```

- Vérification de votre zone actuelle

```bash
sudo named-checkconf la.local /etc/bind/fwd.la.local.db
```

- Vérification en détail d'un serveur fesant partie de notre zone dns

```bash
dig @localhost www.la.local
```
