# Configurer un serveur DNS de mise en cache
La résolution DNS est un élément clé d'un environnement réseau / serveur, et un serveur DNS de mise en cache peut aider à améliorer les performances.
Nous verrons comment configurer un serveur DNS pour mettre en cache les réponses aux requêtes.
Vous pourrez configurer vos serveurs pour utiliser également la mise en cache.

## Configuration d'une zone de DNS basique

- Installer BIND

```bash
sudo apt install bind9 bind9utils bind9-doc
```

- Vérifier named.conf

```bash
cat /etc/bind/named.conf
```

- Copier named.conf.options

```bash
cd /etc/bind/
sudo cp named.conf.options ~/backup
```

- Editer named.conf

```bash
sudo nano /etc/bind/named.conf.options
```
- Ligne à remplacer

```bash
# Effacer puis rajouter cette Configuration
acl goodclients {
    192.168.0.0/24;
    localhost;
    localnets;
};
options {
        directory "/var/cache/bind";
        recursion yes;
        allow-query { goodclients; };
        allow-query-cache { goodclients; };
        allow-recursion { goodclients; };

        forwaders {
             0.0.0.0;
             1.1.1.1;
             1.0.0.1;
        };
```

- Vérifier sa configuration

```bash
sudo named-checkconf
```

- Prise en compte de nos changements

```bash
sudo systemctl restart bind9
```
