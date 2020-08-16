#Configuration de service
##Gérer et configurer des machines virtuelles
Pendant longtemps, les machines virtuelles ont été la seule option disponible pour isoler les systèmes d'exploitation et leurs applications et processus hébergés.
Nous examinerons la création, la gestion et la configuration d'une machine virtuelle Linux exécutée sur un hôte Linux.
Vous pourrez utiliser `virt-manager`, `virt-install` et `virsh` créer, gérer, démarrer et arrêter vos propres machines virtuelles.

- Vérifier si notre machine est configuré pour le manager des VMs (virtual machine extensions)
```bash
cat /proc/cpuinfo | grep vmx
```

- Création d'une machine virtuelle
```bash
virt-install --name=tiny --vcpus=1 --memory=1024 --cdrom=alpine-standard-3.10.3-x86.iso --disk size=5
```

- Lister ses machines virtuelles
```bash
virsh list --all 
```

- Configurer une image avec virsh
```bash
virsh edit alpine 
```

- Redémarrer une machine virtuelle
```bash
virsh autostart alpine 
```

- Désactiver l'autostart d'une machine virtuelle
```bash
virsh autostart --disable alpine 
```

- Cloner une machine virtuelle
```bash
sudo virt-clone --original=alpine --name=newalpine --file=/var/lib/libvirt/images/newalpine.qcow2
virsh list --all 
```

- Lancer le virt manager version gui
```bash
virt-manager 
```
