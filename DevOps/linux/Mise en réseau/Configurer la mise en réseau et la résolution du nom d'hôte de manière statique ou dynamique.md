# Configurer la mise en réseau et la résolution du nom d'hôte de manière statique ou dynamique
Les systèmes Linux partagent des réseaux avec les systèmes Windows, les systèmes MacOS et les périphériques matériels.
Mais maintenant, ils doivent également faire face aux appareils mobiles (tablettes et téléphones) et aux appareils intelligents.
Linux doit être aussi flexible que possible, il doit donc être capable de prendre en charge les adresses IP dynamiques et statiques ainsi que la résolution DNS.
Nous passerons en revue les fichiers nécessaires pour configurer le réseau et la résolution du nom d'hôte, de manière statique ou dynamique, sur les systèmes Debian / Ubuntu et CentOS / RedHat.

## Configuration du réseau les autres distributions

- Informations sur la configuration de son interface

```bash
ifconfig
```

- Informations sur la sources de son interface

```bash
cd etc/network
ls -alh
nano interfaces
```

- Changer son adresse dynamique par une adresse statique

```bash
cd etc/network/interfaces.d/
ls -alh
nano 50-xxx-init.cfg
# Remplacez la fin de ligne dhcp par static
iface ens5 inet static
# Puis juste en dessous rajouter votre adresse
adress 10.9.8.7
netmask 255.255.255.0
gateway 10.9.8.1
dns-search local.la
dns-nameservers 1.1.1.1 1.0.0.1
```

## Configuration du réseau pour Ubuntu/Debian

- Informations sur la configuration de son interface

```bash
ip addr show
```

- Informations sur la sources de son interface

```bash
cd etc/network
ls -alh
nano interfaces
```

- Changer son adresse dynamique par une adresse statique

```bash
cd etc/netplan
ls -alh
nano 50-xxx-init.yaml
# Remplacez à partir de la ligne dhcp4 true par no
    dhcp4: no
    adresses: [10.9.8.7/24]
    gateway: 10.9.8.1
    nameservers:
        adresses: [1.1.1.1,1.0.0.1]
```

## Configuration du réseau pour CentOS/RedHat

- Informations sur la configuration de son interface

```bash
ip addr show
```

- Informations sur la sources de son interface

```bash
cd etc/sysconfig/network-scripts
ls -alh
nano interfaces
```

- Changer son adresse dynamique par une adresse statique

```bash
cd etc/sysconfig/network-scripts
ls -alh
nano ifcfg-ens5
# Mettre none
BOOTPROTO=none
# Puis rajouter
...
IPADDR=10.9.8.7
PREFIX=24
GATEWAY=10.9.8.1
DNS1=1.1.1.1
DNS2=1.0.0.1
```

- Prise en compte du changement de configuration

```bash
sudo ip link set ens5 down && sudo ip link set ens5 up
```
