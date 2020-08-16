#Mise en réseau
##Mettre en œuvre le filtrage de paquets
Protéger une machine en réseau sur Internet peut être un défi aujourd'hui.
Nous verrons comment implémenter le filtrage de paquets à l'aide de la commande `iptables` pour bloquer les paquets ICMP sur un système Linux.
Vous devriez pouvoir l'utiliser `iptables` pour empêcher les paquets non autorisés et l'accès à vos systèmes.


#Création d'une règle (policy) Ubuntu / Debian
- Vérifier la configuration
```bash
sudo iptables -L
```

```bash
# Prendre le nom de votre interface et l'ip
ip addr show
```

- Test de l'ip ping
```bash
ping -c3 172.0.19.3
# Reponse ok
```

- Création de la règles
```bash
sudo iptables -A INPUT --protocol icmp --in-interface ens5 -j REJET
```

- Test de l'ip ping
```bash
ping -c3 172.0.19.3
# Port Unreachable
```

- Revenir à la configuration par défaut
```bash
sudo iptables --flush
```

- Création de la règles
```bash
sudo iptables -A INPUT --protocol icmp --in-interface ens5 -j DROP
```

REJECT vs DROP
La différence est que la cible REJECT envoie une réponse de rejet à la source, tandis que la cible DROP n'envoie rien.
Cela peut être utile par exemple pour le service ident.
Si vous utilisez REJECT, les clients n'ont pas besoin d'attendre le délai d'expiration.

Donc, après application de notre policy de DROP depuis notre machine local en 172.0.19.10 n'enverra donc aucune réponse si depuis la machine 172.0.19.3 nous faisons un test avec ping.

